#!/usr/bin/python

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
import numpy as np
from primeiro_proj.srv import situation

class myCamera():

    def __init__(self):
        print('init camera')
        # Bridge to convert ROS message to openCV
        self.bridge = CvBridge()

        # Subscriber to the camera image
        self.image_sub = rospy.Subscriber("/xtion/rgb/image_color",Image,self.callback_SubscribeCamera)
        self.cv_image = Image()
        self.image = Image()
        # Server Service camera
        
        rospy.init_node("situation_srv")
        service = rospy.Service("situation", situation, self.callback_ServiceCamera)
        rospy.spin()
        

    def callback_ServiceCamera(self, request):
        print('image service')
        # cv_image[linha][coluna][bgr] bgr-> 0:blue, 1:green, 2:red
        flag = 0
        test = 0
        for i in range(600):
            for j in range(480):
                #print(self.cv_image[j][i][:])
                if(self.cv_image[j][i][0] > 150):
                    flag = 1
                    #print(flag)
                    #print(self.cv_image[j][i][:])
                    return 1
                elif(self.cv_image[j][i][1] > 60 and self.cv_image[j][i][0] < 10 and self.cv_image[j][i][2] < 10):
                    flag = 2
                    #print(flag)
                    #print(self.cv_image[j][i][:])
                    return 2
                elif(self.cv_image[j][i][2] > 100 and self.cv_image[j][i][0] < 90 and self.cv_image[j][i][1] < 90):
                    test =self.cv_image[j][i][2]
                    flag = 3
                    #print(flag)
                    #print(self.cv_image[j][i][:])
                    return 3
    
    def callback_SubscribeCamera(self, msg):
        #print('callback camera')
        try:
            self.cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Display the image
        cv2.imshow("raw", self.cv_image)
        cv2.waitKey(3)

if __name__ == '__main__':
    cam = myCamera()
    
