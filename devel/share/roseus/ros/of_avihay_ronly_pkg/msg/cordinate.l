;; Auto-generated. Do not edit!


(when (boundp 'of_avihay_ronly_pkg::cordinate)
  (if (not (find-package "OF_AVIHAY_RONLY_PKG"))
    (make-package "OF_AVIHAY_RONLY_PKG"))
  (shadow 'cordinate (find-package "OF_AVIHAY_RONLY_PKG")))
(unless (find-package "OF_AVIHAY_RONLY_PKG::CORDINATE")
  (make-package "OF_AVIHAY_RONLY_PKG::CORDINATE"))

(in-package "ROS")
;;//! \htmlinclude cordinate.msg.html


(defclass of_avihay_ronly_pkg::cordinate
  :super ros::object
  :slots (_x _y ))

(defmethod of_avihay_ronly_pkg::cordinate
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get of_avihay_ronly_pkg::cordinate :md5sum-) "ff8d7d66dd3e4b731ef14a45d38888b6")
(setf (get of_avihay_ronly_pkg::cordinate :datatype-) "of_avihay_ronly_pkg/cordinate")
(setf (get of_avihay_ronly_pkg::cordinate :definition-)
      "float32 x
float32 y



")



(provide :of_avihay_ronly_pkg/cordinate "ff8d7d66dd3e4b731ef14a45d38888b6")

