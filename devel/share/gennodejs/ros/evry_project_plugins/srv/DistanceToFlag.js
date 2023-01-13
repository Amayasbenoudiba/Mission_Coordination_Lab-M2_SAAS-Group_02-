// Auto-generated. Do not edit!

// (in-package evry_project_plugins.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class DistanceToFlagRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.agent_pose = null;
      this.id_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('agent_pose')) {
        this.agent_pose = initObj.agent_pose
      }
      else {
        this.agent_pose = new geometry_msgs.msg.Pose2D();
      }
      if (initObj.hasOwnProperty('id_flag')) {
        this.id_flag = initObj.id_flag
      }
      else {
        this.id_flag = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DistanceToFlagRequest
    // Serialize message field [agent_pose]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.agent_pose, buffer, bufferOffset);
    // Serialize message field [id_flag]
    bufferOffset = _serializer.int64(obj.id_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DistanceToFlagRequest
    let len;
    let data = new DistanceToFlagRequest(null);
    // Deserialize message field [agent_pose]
    data.agent_pose = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [id_flag]
    data.id_flag = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'evry_project_plugins/DistanceToFlagRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a87fe30206b654a56a3d2b0174397bd3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose2D agent_pose
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DistanceToFlagRequest(null);
    if (msg.agent_pose !== undefined) {
      resolved.agent_pose = geometry_msgs.msg.Pose2D.Resolve(msg.agent_pose)
    }
    else {
      resolved.agent_pose = new geometry_msgs.msg.Pose2D()
    }

    if (msg.id_flag !== undefined) {
      resolved.id_flag = msg.id_flag;
    }
    else {
      resolved.id_flag = 0
    }

    return resolved;
    }
};

class DistanceToFlagResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DistanceToFlagResponse
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DistanceToFlagResponse
    let len;
    let data = new DistanceToFlagResponse(null);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'evry_project_plugins/DistanceToFlagResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'acff7fda0c683c872875f5c4b069f124';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DistanceToFlagResponse(null);
    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: DistanceToFlagRequest,
  Response: DistanceToFlagResponse,
  md5sum() { return 'cd4f1364f476ebbbc1f9cba4aa416890'; },
  datatype() { return 'evry_project_plugins/DistanceToFlag'; }
};
