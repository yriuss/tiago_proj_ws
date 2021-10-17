; Auto-generated. Do not edit!


(cl:in-package primeiro_proj-srv)


;//! \htmlinclude situation-request.msg.html

(cl:defclass <situation-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass situation-request (<situation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <situation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'situation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name primeiro_proj-srv:<situation-request> is deprecated: use primeiro_proj-srv:situation-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <situation-request>) ostream)
  "Serializes a message object of type '<situation-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <situation-request>) istream)
  "Deserializes a message object of type '<situation-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<situation-request>)))
  "Returns string type for a service object of type '<situation-request>"
  "primeiro_proj/situationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'situation-request)))
  "Returns string type for a service object of type 'situation-request"
  "primeiro_proj/situationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<situation-request>)))
  "Returns md5sum for a message object of type '<situation-request>"
  "f737e5fcbaaa86f9d9437904e7db66b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'situation-request)))
  "Returns md5sum for a message object of type 'situation-request"
  "f737e5fcbaaa86f9d9437904e7db66b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<situation-request>)))
  "Returns full string definition for message of type '<situation-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'situation-request)))
  "Returns full string definition for message of type 'situation-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <situation-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <situation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'situation-request
))
;//! \htmlinclude situation-response.msg.html

(cl:defclass <situation-response> (roslisp-msg-protocol:ros-message)
  ((situation
    :reader situation
    :initarg :situation
    :type cl:fixnum
    :initform 0))
)

(cl:defclass situation-response (<situation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <situation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'situation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name primeiro_proj-srv:<situation-response> is deprecated: use primeiro_proj-srv:situation-response instead.")))

(cl:ensure-generic-function 'situation-val :lambda-list '(m))
(cl:defmethod situation-val ((m <situation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader primeiro_proj-srv:situation-val is deprecated.  Use primeiro_proj-srv:situation instead.")
  (situation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <situation-response>) ostream)
  "Serializes a message object of type '<situation-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'situation)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <situation-response>) istream)
  "Deserializes a message object of type '<situation-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'situation)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<situation-response>)))
  "Returns string type for a service object of type '<situation-response>"
  "primeiro_proj/situationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'situation-response)))
  "Returns string type for a service object of type 'situation-response"
  "primeiro_proj/situationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<situation-response>)))
  "Returns md5sum for a message object of type '<situation-response>"
  "f737e5fcbaaa86f9d9437904e7db66b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'situation-response)))
  "Returns md5sum for a message object of type 'situation-response"
  "f737e5fcbaaa86f9d9437904e7db66b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<situation-response>)))
  "Returns full string definition for message of type '<situation-response>"
  (cl:format cl:nil "uint8 situation # situation of the tiago robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'situation-response)))
  "Returns full string definition for message of type 'situation-response"
  (cl:format cl:nil "uint8 situation # situation of the tiago robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <situation-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <situation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'situation-response
    (cl:cons ':situation (situation msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'situation)))
  'situation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'situation)))
  'situation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'situation)))
  "Returns string type for a service object of type '<situation>"
  "primeiro_proj/situation")