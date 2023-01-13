
(cl:in-package :asdf)

(defsystem "evry_project_plugins-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "DistanceToFlag" :depends-on ("_package_DistanceToFlag"))
    (:file "_package_DistanceToFlag" :depends-on ("_package"))
  ))