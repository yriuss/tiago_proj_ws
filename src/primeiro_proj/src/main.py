#!/usr/bin/python
import rospy
from geometry_msgs.msg import Twist
from geometry_msgs.msg import PointStamped
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from nav_msgs.msg import Odometry
from sensor_msgs.msg import LaserScan
from math import pow, atan2, sqrt, pi,fmod
import tf
from primeiro_proj.srv import situation

class Tiago:

    def __init__(self):
        rospy.init_node('tiago_move', anonymous=True)
        self.last_scan = LaserScan()
        self.vel_pub = rospy.Publisher("/mobile_base_controller/cmd_vel",
                                                  Twist, queue_size=1)
                                                  
        self.pose_subscriber = rospy.Subscriber("/mobile_base_controller/odom",
                                                Odometry, self.odom_cb)
        self.laser_sub = rospy.Subscriber('/scan_raw',
                                           LaserScan,
                                           self.scan_cb,
                                           queue_size=1)
        self.head_cmd = rospy.Publisher(
			'/head_controller/command', JointTrajectory, queue_size=1)
        self.twist = Twist()
        
        # angular and linear velocities
        self.ang_vel = 0
        self.lin_vel = 0

        # angular and linear positions
        self.x = 0
        self.y = 0
        self.ang = 0

        self.decision_var = 'move_straight'
        
        self.rate = rospy.Rate(10)
    
    def scan_cb(self, msg):
         self.last_scan = msg
    
    def odom_cb(self, data):
        self.lin_vel = data.twist.twist.linear.x
        self.ang_vel = data.twist.twist.angular.z
        quaternion = (
            data.pose.pose.orientation.x,
            data.pose.pose.orientation.y,
            data.pose.pose.orientation.z,
            data.pose.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(quaternion)
        self.x = data.pose.pose.position.x
        self.y = data.pose.pose.position.y
        self.ang = euler[2]
    
    def move_head_to_left(self):
        jt = JointTrajectory()
        jt.joint_names = ['head_1_joint', 'head_2_joint']
        jtp = JointTrajectoryPoint()
        jtp.positions = [pi/2 , 0]
        jt.points.append(jtp)
        jtp.time_from_start = rospy.Duration(2.0)
        i = 0
        rospy.sleep(2)
        self.head_cmd.publish(jt)
        rospy.sleep(2)

    def look_forward(self):
        jt = JointTrajectory()
        jt.joint_names = ['head_1_joint', 'head_2_joint']
        jtp = JointTrajectoryPoint()
        jtp.positions = [0 , 0]
        jt.points.append(jtp)
        jtp.time_from_start = rospy.Duration(2.0)
        i = 0
        rospy.sleep(2)
        self.head_cmd.publish(jt)
        rospy.sleep(2)

    def move_head_to_right(self):
        jt = JointTrajectory()
        jt.joint_names = ['head_1_joint', 'head_2_joint']
        jtp = JointTrajectoryPoint()
        jtp.positions = [-pi/2 , 0]
        jt.points.append(jtp)
        jtp.time_from_start = rospy.Duration(2.0)
        i = 0
        rospy.sleep(2)
        self.head_cmd.publish(jt)
        rospy.sleep(2)


    def to_positive_angle(self, angle):
        angle = fmod(angle, 2*pi)
        while( angle < 0 ):
            angle = angle + 2*pi
        return angle

    def smallest_angle_diff(self, target, source):
        a = self.to_positive_angle(target) - self.to_positive_angle(source)
        if(a > pi):
            a = a - 2*pi
        elif(a < -pi):
            a = a + 2*pi
        return a

    def turn_right(self):
        obj_ang = self.smallest_angle_diff(self.to_positive_angle(self.ang),pi/2)
        #print(self.smallest_angle_diff(self.ang,obj_ang))
        while(abs(self.smallest_angle_diff(self.ang,obj_ang)) > 0.05):
            #print('Distance from target:')
            #print(self.smallest_angle_diff(obj_ang, self.ang))
            self.twist.angular.z = -abs(self.smallest_angle_diff(self.ang,obj_ang))
            self.vel_pub.publish(self.twist)

    def turn_left(self):
        obj_ang = self.to_positive_angle(pi/2 + self.to_positive_angle(self.ang))
        while(self.smallest_angle_diff(obj_ang, self.to_positive_angle(self.ang)) > 0.05):
            #print('Distance from target:')
            #print(self.smallest_angle_diff(obj_ang, self.ang))
            self.twist.angular.z = self.smallest_angle_diff(obj_ang, self.to_positive_angle(self.ang))
            self.vel_pub.publish(self.twist)

    def receive_situation(self):
        # cv_image[linha][coluna][bgr] bgr-> 0:blue, 1:green, 2:red
        rospy.wait_for_service('situation')
        try:
            req = rospy.ServiceProxy('situation', situation)
            resp = req()
            return resp.situation
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
        

    def decision(self):
        #print(self.last_scan.ranges[30])
        if(self.last_scan.ranges[30] > 1.5):
            if(self.last_scan.ranges[-30] > 1.5):
                self.decision_var = "process_image"
            else:
                if(self.last_scan.ranges[len(self.last_scan.ranges)/2] < 0.7):
                    self.decision_var = "turn_right"
                else:
                    self.decision_var = "move_straight"
        elif(self.last_scan.ranges[-30] > 1.5 and self.last_scan.ranges[len(self.last_scan.ranges)/2] < 0.7):
            self.decision_var = "turn_left"
        else:
            self.decision_var = "move_straight"
        
    
    def move_straight(self):
        #print(self.last_scan)
        if(self.last_scan.ranges):
            while(self.last_scan.ranges[len(self.last_scan.ranges)/2] > 0.7):
                self.twist.linear.x = 0.5*self.last_scan.ranges[len(self.last_scan.ranges)/2]
                tiago.vel_pub.publish(tiago.twist)
        self.twist.linear.x = 0
        tiago.vel_pub.publish(tiago.twist)
        #print(f'Velocidade: {self.lin_vel}')
        #print(f'Orientacao: {self.ang_vel}')
        #print(self.last_scan)
    #######

if __name__ == '__main__':

    tiago = Tiago()
    
    rospy.sleep(2)

    state = 0


    while(not rospy.is_shutdown()):
        if state == 0:
            # decision
            tiago.decision()
            if(tiago.decision_var == "process_image"):
                state = 1
            elif(tiago.decision_var == "move_straight"):
                state = 2
            elif(tiago.decision_var == "turn_left"):
                state = 3
            elif(tiago.decision_var == "turn_right"):
                state = 4     
            else:
                state = 5

        elif state == 1:
            # image processing
            tiago.move_head_to_right()
            flag_red = tiago.receive_situation()
            tiago.move_head_to_left()
            flag_green = tiago.receive_situation()
            if(flag_red == 3 and flag_green == 2):
                    tiago.look_forward()
                    state = 3
            else:
                state = 5


            # compute next state
            

        elif state == 2:
            # move straight
            tiago.move_straight()
            # compute next state
            state = 0

        elif state == 3:
            # turn left
            tiago.turn_left()
            # compute next state
            state = 0
            pass
        elif state == 4:
            # turn right
            tiago.turn_right()
            # compute next state
            state = 0
            pass 
        elif state == 5:
            print("Estado final!")