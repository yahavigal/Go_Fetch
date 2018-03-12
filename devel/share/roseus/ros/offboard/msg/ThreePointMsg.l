;; Auto-generated. Do not edit!


(when (boundp 'offboard::ThreePointMsg)
  (if (not (find-package "OFFBOARD"))
    (make-package "OFFBOARD"))
  (shadow 'ThreePointMsg (find-package "OFFBOARD")))
(unless (find-package "OFFBOARD::THREEPOINTMSG")
  (make-package "OFFBOARD::THREEPOINTMSG"))

(in-package "ROS")
;;//! \htmlinclude ThreePointMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass offboard::ThreePointMsg
  :super ros::object
  :slots (_header _prev _ctrl _next _duration _max_acc _acc_per_err ))

(defmethod offboard::ThreePointMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:prev __prev) (instance geometry_msgs::Point :init))
    ((:ctrl __ctrl) (instance geometry_msgs::Point :init))
    ((:next __next) (instance geometry_msgs::Point :init))
    ((:duration __duration) 0.0)
    ((:max_acc __max_acc) 0.0)
    ((:acc_per_err __acc_per_err) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _prev __prev)
   (setq _ctrl __ctrl)
   (setq _next __next)
   (setq _duration (float __duration))
   (setq _max_acc (float __max_acc))
   (setq _acc_per_err (float __acc_per_err))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:prev
   (&rest __prev)
   (if (keywordp (car __prev))
       (send* _prev __prev)
     (progn
       (if __prev (setq _prev (car __prev)))
       _prev)))
  (:ctrl
   (&rest __ctrl)
   (if (keywordp (car __ctrl))
       (send* _ctrl __ctrl)
     (progn
       (if __ctrl (setq _ctrl (car __ctrl)))
       _ctrl)))
  (:next
   (&rest __next)
   (if (keywordp (car __next))
       (send* _next __next)
     (progn
       (if __next (setq _next (car __next)))
       _next)))
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:max_acc
   (&optional __max_acc)
   (if __max_acc (setq _max_acc __max_acc)) _max_acc)
  (:acc_per_err
   (&optional __acc_per_err)
   (if __acc_per_err (setq _acc_per_err __acc_per_err)) _acc_per_err)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _prev
    (send _prev :serialization-length)
    ;; geometry_msgs/Point _ctrl
    (send _ctrl :serialization-length)
    ;; geometry_msgs/Point _next
    (send _next :serialization-length)
    ;; float64 _duration
    8
    ;; float64 _max_acc
    8
    ;; float64 _acc_per_err
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _prev
       (send _prev :serialize s)
     ;; geometry_msgs/Point _ctrl
       (send _ctrl :serialize s)
     ;; geometry_msgs/Point _next
       (send _next :serialize s)
     ;; float64 _duration
       (sys::poke _duration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_acc
       (sys::poke _max_acc (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acc_per_err
       (sys::poke _acc_per_err (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _prev
     (send _prev :deserialize buf ptr-) (incf ptr- (send _prev :serialization-length))
   ;; geometry_msgs/Point _ctrl
     (send _ctrl :deserialize buf ptr-) (incf ptr- (send _ctrl :serialization-length))
   ;; geometry_msgs/Point _next
     (send _next :deserialize buf ptr-) (incf ptr- (send _next :serialization-length))
   ;; float64 _duration
     (setq _duration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_acc
     (setq _max_acc (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acc_per_err
     (setq _acc_per_err (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get offboard::ThreePointMsg :md5sum-) "650650bb6026facc7a996bdd041b7323")
(setf (get offboard::ThreePointMsg :datatype-) "offboard/ThreePointMsg")
(setf (get offboard::ThreePointMsg :definition-)
      "Header header
geometry_msgs/Point prev
geometry_msgs/Point ctrl
geometry_msgs/Point next
float64 duration
float64 max_acc
float64 acc_per_err
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :offboard/ThreePointMsg "650650bb6026facc7a996bdd041b7323")


