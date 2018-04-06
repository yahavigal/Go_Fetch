
(cl:in-package :asdf)

(defsystem "of_avihay_ronly_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cordinate" :depends-on ("_package_cordinate"))
    (:file "_package_cordinate" :depends-on ("_package"))
  ))