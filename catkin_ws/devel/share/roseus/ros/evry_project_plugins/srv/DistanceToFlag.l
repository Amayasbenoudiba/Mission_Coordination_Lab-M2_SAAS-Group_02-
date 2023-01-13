;; Auto-generated. Do not edit!


(when (boundp 'evry_project_plugins::DistanceToFlag)
  (if (not (find-package "EVRY_PROJECT_PLUGINS"))
    (make-package "EVRY_PROJECT_PLUGINS"))
  (shadow 'DistanceToFlag (find-package "EVRY_PROJECT_PLUGINS")))
(unless (find-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAG")
  (make-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAG"))
(unless (find-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAGREQUEST")
  (make-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAGREQUEST"))
(unless (find-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAGRESPONSE")
  (make-package "EVRY_PROJECT_PLUGINS::DISTANCETOFLAGRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass evry_project_plugins::DistanceToFlagRequest
  :super ros::object
  :slots (_agent_pose _id_flag ))

(defmethod evry_project_plugins::DistanceToFlagRequest
  (:init
   (&key
    ((:agent_pose __agent_pose) (instance geometry_msgs::Pose2D :init))
    ((:id_flag __id_flag) 0)
    )
   (send-super :init)
   (setq _agent_pose __agent_pose)
   (setq _id_flag (round __id_flag))
   self)
  (:agent_pose
   (&rest __agent_pose)
   (if (keywordp (car __agent_pose))
       (send* _agent_pose __agent_pose)
     (progn
       (if __agent_pose (setq _agent_pose (car __agent_pose)))
       _agent_pose)))
  (:id_flag
   (&optional __id_flag)
   (if __id_flag (setq _id_flag __id_flag)) _id_flag)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _agent_pose
    (send _agent_pose :serialization-length)
    ;; int64 _id_flag
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _agent_pose
       (send _agent_pose :serialize s)
     ;; int64 _id_flag
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id_flag (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id_flag) (= (length (_id_flag . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id_flag . bv) 0) 0) s)
              (write-long (ash (elt (_id_flag . bv) 1) -1) s))
             ((and (class _id_flag) (= (length (_id_flag . bv)) 1)) ;; big1
              (write-long (elt (_id_flag . bv) 0) s)
              (write-long (if (>= _id_flag 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id_flag s)(write-long (if (>= _id_flag 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _agent_pose
     (send _agent_pose :deserialize buf ptr-) (incf ptr- (send _agent_pose :serialization-length))
   ;; int64 _id_flag
#+(or :alpha :irix6 :x86_64)
      (setf _id_flag (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id_flag (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass evry_project_plugins::DistanceToFlagResponse
  :super ros::object
  :slots (_distance ))

(defmethod evry_project_plugins::DistanceToFlagResponse
  (:init
   (&key
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass evry_project_plugins::DistanceToFlag
  :super ros::object
  :slots ())

(setf (get evry_project_plugins::DistanceToFlag :md5sum-) "cd4f1364f476ebbbc1f9cba4aa416890")
(setf (get evry_project_plugins::DistanceToFlag :datatype-) "evry_project_plugins/DistanceToFlag")
(setf (get evry_project_plugins::DistanceToFlag :request) evry_project_plugins::DistanceToFlagRequest)
(setf (get evry_project_plugins::DistanceToFlag :response) evry_project_plugins::DistanceToFlagResponse)

(defmethod evry_project_plugins::DistanceToFlagRequest
  (:response () (instance evry_project_plugins::DistanceToFlagResponse :init)))

(setf (get evry_project_plugins::DistanceToFlagRequest :md5sum-) "cd4f1364f476ebbbc1f9cba4aa416890")
(setf (get evry_project_plugins::DistanceToFlagRequest :datatype-) "evry_project_plugins/DistanceToFlagRequest")
(setf (get evry_project_plugins::DistanceToFlagRequest :definition-)
      "geometry_msgs/Pose2D agent_pose
int64 id_flag

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
---
float64 distance
")

(setf (get evry_project_plugins::DistanceToFlagResponse :md5sum-) "cd4f1364f476ebbbc1f9cba4aa416890")
(setf (get evry_project_plugins::DistanceToFlagResponse :datatype-) "evry_project_plugins/DistanceToFlagResponse")
(setf (get evry_project_plugins::DistanceToFlagResponse :definition-)
      "geometry_msgs/Pose2D agent_pose
int64 id_flag

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
---
float64 distance
")



(provide :evry_project_plugins/DistanceToFlag "cd4f1364f476ebbbc1f9cba4aa416890")


