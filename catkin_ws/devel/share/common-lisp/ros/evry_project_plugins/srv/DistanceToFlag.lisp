; Auto-generated. Do not edit!


(cl:in-package evry_project_plugins-srv)


;//! \htmlinclude DistanceToFlag-request.msg.html

(cl:defclass <DistanceToFlag-request> (roslisp-msg-protocol:ros-message)
  ((agent_pose
    :reader agent_pose
    :initarg :agent_pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (id_flag
    :reader id_flag
    :initarg :id_flag
    :type cl:integer
    :initform 0))
)

(cl:defclass DistanceToFlag-request (<DistanceToFlag-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DistanceToFlag-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DistanceToFlag-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name evry_project_plugins-srv:<DistanceToFlag-request> is deprecated: use evry_project_plugins-srv:DistanceToFlag-request instead.")))

(cl:ensure-generic-function 'agent_pose-val :lambda-list '(m))
(cl:defmethod agent_pose-val ((m <DistanceToFlag-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader evry_project_plugins-srv:agent_pose-val is deprecated.  Use evry_project_plugins-srv:agent_pose instead.")
  (agent_pose m))

(cl:ensure-generic-function 'id_flag-val :lambda-list '(m))
(cl:defmethod id_flag-val ((m <DistanceToFlag-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader evry_project_plugins-srv:id_flag-val is deprecated.  Use evry_project_plugins-srv:id_flag instead.")
  (id_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DistanceToFlag-request>) ostream)
  "Serializes a message object of type '<DistanceToFlag-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'agent_pose) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id_flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DistanceToFlag-request>) istream)
  "Deserializes a message object of type '<DistanceToFlag-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'agent_pose) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id_flag) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DistanceToFlag-request>)))
  "Returns string type for a service object of type '<DistanceToFlag-request>"
  "evry_project_plugins/DistanceToFlagRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DistanceToFlag-request)))
  "Returns string type for a service object of type 'DistanceToFlag-request"
  "evry_project_plugins/DistanceToFlagRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DistanceToFlag-request>)))
  "Returns md5sum for a message object of type '<DistanceToFlag-request>"
  "cd4f1364f476ebbbc1f9cba4aa416890")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DistanceToFlag-request)))
  "Returns md5sum for a message object of type 'DistanceToFlag-request"
  "cd4f1364f476ebbbc1f9cba4aa416890")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DistanceToFlag-request>)))
  "Returns full string definition for message of type '<DistanceToFlag-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D agent_pose~%int64 id_flag~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DistanceToFlag-request)))
  "Returns full string definition for message of type 'DistanceToFlag-request"
  (cl:format cl:nil "geometry_msgs/Pose2D agent_pose~%int64 id_flag~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DistanceToFlag-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'agent_pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DistanceToFlag-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DistanceToFlag-request
    (cl:cons ':agent_pose (agent_pose msg))
    (cl:cons ':id_flag (id_flag msg))
))
;//! \htmlinclude DistanceToFlag-response.msg.html

(cl:defclass <DistanceToFlag-response> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass DistanceToFlag-response (<DistanceToFlag-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DistanceToFlag-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DistanceToFlag-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name evry_project_plugins-srv:<DistanceToFlag-response> is deprecated: use evry_project_plugins-srv:DistanceToFlag-response instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <DistanceToFlag-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader evry_project_plugins-srv:distance-val is deprecated.  Use evry_project_plugins-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DistanceToFlag-response>) ostream)
  "Serializes a message object of type '<DistanceToFlag-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DistanceToFlag-response>) istream)
  "Deserializes a message object of type '<DistanceToFlag-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DistanceToFlag-response>)))
  "Returns string type for a service object of type '<DistanceToFlag-response>"
  "evry_project_plugins/DistanceToFlagResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DistanceToFlag-response)))
  "Returns string type for a service object of type 'DistanceToFlag-response"
  "evry_project_plugins/DistanceToFlagResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DistanceToFlag-response>)))
  "Returns md5sum for a message object of type '<DistanceToFlag-response>"
  "cd4f1364f476ebbbc1f9cba4aa416890")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DistanceToFlag-response)))
  "Returns md5sum for a message object of type 'DistanceToFlag-response"
  "cd4f1364f476ebbbc1f9cba4aa416890")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DistanceToFlag-response>)))
  "Returns full string definition for message of type '<DistanceToFlag-response>"
  (cl:format cl:nil "float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DistanceToFlag-response)))
  "Returns full string definition for message of type 'DistanceToFlag-response"
  (cl:format cl:nil "float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DistanceToFlag-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DistanceToFlag-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DistanceToFlag-response
    (cl:cons ':distance (distance msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DistanceToFlag)))
  'DistanceToFlag-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DistanceToFlag)))
  'DistanceToFlag-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DistanceToFlag)))
  "Returns string type for a service object of type '<DistanceToFlag>"
  "evry_project_plugins/DistanceToFlag")