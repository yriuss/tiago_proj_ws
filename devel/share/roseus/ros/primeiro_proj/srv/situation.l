;; Auto-generated. Do not edit!


(when (boundp 'primeiro_proj::situation)
  (if (not (find-package "PRIMEIRO_PROJ"))
    (make-package "PRIMEIRO_PROJ"))
  (shadow 'situation (find-package "PRIMEIRO_PROJ")))
(unless (find-package "PRIMEIRO_PROJ::SITUATION")
  (make-package "PRIMEIRO_PROJ::SITUATION"))
(unless (find-package "PRIMEIRO_PROJ::SITUATIONREQUEST")
  (make-package "PRIMEIRO_PROJ::SITUATIONREQUEST"))
(unless (find-package "PRIMEIRO_PROJ::SITUATIONRESPONSE")
  (make-package "PRIMEIRO_PROJ::SITUATIONRESPONSE"))

(in-package "ROS")





(defclass primeiro_proj::situationRequest
  :super ros::object
  :slots ())

(defmethod primeiro_proj::situationRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass primeiro_proj::situationResponse
  :super ros::object
  :slots (_situation ))

(defmethod primeiro_proj::situationResponse
  (:init
   (&key
    ((:situation __situation) 0)
    )
   (send-super :init)
   (setq _situation (round __situation))
   self)
  (:situation
   (&optional __situation)
   (if __situation (setq _situation __situation)) _situation)
  (:serialization-length
   ()
   (+
    ;; uint8 _situation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _situation
       (write-byte _situation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _situation
     (setq _situation (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass primeiro_proj::situation
  :super ros::object
  :slots ())

(setf (get primeiro_proj::situation :md5sum-) "f737e5fcbaaa86f9d9437904e7db66b6")
(setf (get primeiro_proj::situation :datatype-) "primeiro_proj/situation")
(setf (get primeiro_proj::situation :request) primeiro_proj::situationRequest)
(setf (get primeiro_proj::situation :response) primeiro_proj::situationResponse)

(defmethod primeiro_proj::situationRequest
  (:response () (instance primeiro_proj::situationResponse :init)))

(setf (get primeiro_proj::situationRequest :md5sum-) "f737e5fcbaaa86f9d9437904e7db66b6")
(setf (get primeiro_proj::situationRequest :datatype-) "primeiro_proj/situationRequest")
(setf (get primeiro_proj::situationRequest :definition-)
      "---
uint8 situation # situation of the tiago robot

")

(setf (get primeiro_proj::situationResponse :md5sum-) "f737e5fcbaaa86f9d9437904e7db66b6")
(setf (get primeiro_proj::situationResponse :datatype-) "primeiro_proj/situationResponse")
(setf (get primeiro_proj::situationResponse :definition-)
      "---
uint8 situation # situation of the tiago robot

")



(provide :primeiro_proj/situation "f737e5fcbaaa86f9d9437904e7db66b6")


