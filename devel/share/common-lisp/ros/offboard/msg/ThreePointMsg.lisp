; Auto-generated. Do not edit!


(cl:in-package offboard-msg)


;//! \htmlinclude ThreePointMsg.msg.html

(cl:defclass <ThreePointMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (prev
    :reader prev
    :initarg :prev
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (ctrl
    :reader ctrl
    :initarg :ctrl
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (next
    :reader next
    :initarg :next
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0)
   (max_acc
    :reader max_acc
    :initarg :max_acc
    :type cl:float
    :initform 0.0)
   (acc_per_err
    :reader acc_per_err
    :initarg :acc_per_err
    :type cl:float
    :initform 0.0))
)

(cl:defclass ThreePointMsg (<ThreePointMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThreePointMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThreePointMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name offboard-msg:<ThreePointMsg> is deprecated: use offboard-msg:ThreePointMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:header-val is deprecated.  Use offboard-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'prev-val :lambda-list '(m))
(cl:defmethod prev-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:prev-val is deprecated.  Use offboard-msg:prev instead.")
  (prev m))

(cl:ensure-generic-function 'ctrl-val :lambda-list '(m))
(cl:defmethod ctrl-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:ctrl-val is deprecated.  Use offboard-msg:ctrl instead.")
  (ctrl m))

(cl:ensure-generic-function 'next-val :lambda-list '(m))
(cl:defmethod next-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:next-val is deprecated.  Use offboard-msg:next instead.")
  (next m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:duration-val is deprecated.  Use offboard-msg:duration instead.")
  (duration m))

(cl:ensure-generic-function 'max_acc-val :lambda-list '(m))
(cl:defmethod max_acc-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:max_acc-val is deprecated.  Use offboard-msg:max_acc instead.")
  (max_acc m))

(cl:ensure-generic-function 'acc_per_err-val :lambda-list '(m))
(cl:defmethod acc_per_err-val ((m <ThreePointMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader offboard-msg:acc_per_err-val is deprecated.  Use offboard-msg:acc_per_err instead.")
  (acc_per_err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThreePointMsg>) ostream)
  "Serializes a message object of type '<ThreePointMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'prev) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ctrl) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'next) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_acc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'acc_per_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThreePointMsg>) istream)
  "Deserializes a message object of type '<ThreePointMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'prev) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ctrl) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'next) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_acc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_per_err) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThreePointMsg>)))
  "Returns string type for a message object of type '<ThreePointMsg>"
  "offboard/ThreePointMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThreePointMsg)))
  "Returns string type for a message object of type 'ThreePointMsg"
  "offboard/ThreePointMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThreePointMsg>)))
  "Returns md5sum for a message object of type '<ThreePointMsg>"
  "650650bb6026facc7a996bdd041b7323")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThreePointMsg)))
  "Returns md5sum for a message object of type 'ThreePointMsg"
  "650650bb6026facc7a996bdd041b7323")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThreePointMsg>)))
  "Returns full string definition for message of type '<ThreePointMsg>"
  (cl:format cl:nil "Header header~%geometry_msgs/Point prev~%geometry_msgs/Point ctrl~%geometry_msgs/Point next~%float64 duration~%float64 max_acc~%float64 acc_per_err~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThreePointMsg)))
  "Returns full string definition for message of type 'ThreePointMsg"
  (cl:format cl:nil "Header header~%geometry_msgs/Point prev~%geometry_msgs/Point ctrl~%geometry_msgs/Point next~%float64 duration~%float64 max_acc~%float64 acc_per_err~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThreePointMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'prev))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ctrl))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'next))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThreePointMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ThreePointMsg
    (cl:cons ':header (header msg))
    (cl:cons ':prev (prev msg))
    (cl:cons ':ctrl (ctrl msg))
    (cl:cons ':next (next msg))
    (cl:cons ':duration (duration msg))
    (cl:cons ':max_acc (max_acc msg))
    (cl:cons ':acc_per_err (acc_per_err msg))
))
