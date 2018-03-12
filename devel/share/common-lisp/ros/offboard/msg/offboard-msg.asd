
(cl:in-package :asdf)

(defsystem "offboard-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ThreePointMsg" :depends-on ("_package_ThreePointMsg"))
    (:file "_package_ThreePointMsg" :depends-on ("_package"))
  ))