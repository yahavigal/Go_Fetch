// Auto-generated. Do not edit!

// (in-package offboard.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ThreePointMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.prev = null;
      this.ctrl = null;
      this.next = null;
      this.duration = null;
      this.max_acc = null;
      this.acc_per_err = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('prev')) {
        this.prev = initObj.prev
      }
      else {
        this.prev = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('ctrl')) {
        this.ctrl = initObj.ctrl
      }
      else {
        this.ctrl = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('next')) {
        this.next = initObj.next
      }
      else {
        this.next = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0.0;
      }
      if (initObj.hasOwnProperty('max_acc')) {
        this.max_acc = initObj.max_acc
      }
      else {
        this.max_acc = 0.0;
      }
      if (initObj.hasOwnProperty('acc_per_err')) {
        this.acc_per_err = initObj.acc_per_err
      }
      else {
        this.acc_per_err = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThreePointMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [prev]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.prev, buffer, bufferOffset);
    // Serialize message field [ctrl]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.ctrl, buffer, bufferOffset);
    // Serialize message field [next]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.next, buffer, bufferOffset);
    // Serialize message field [duration]
    bufferOffset = _serializer.float64(obj.duration, buffer, bufferOffset);
    // Serialize message field [max_acc]
    bufferOffset = _serializer.float64(obj.max_acc, buffer, bufferOffset);
    // Serialize message field [acc_per_err]
    bufferOffset = _serializer.float64(obj.acc_per_err, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThreePointMsg
    let len;
    let data = new ThreePointMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [prev]
    data.prev = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [ctrl]
    data.ctrl = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [next]
    data.next = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [duration]
    data.duration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_acc]
    data.max_acc = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acc_per_err]
    data.acc_per_err = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'offboard/ThreePointMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '650650bb6026facc7a996bdd041b7323';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThreePointMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.prev !== undefined) {
      resolved.prev = geometry_msgs.msg.Point.Resolve(msg.prev)
    }
    else {
      resolved.prev = new geometry_msgs.msg.Point()
    }

    if (msg.ctrl !== undefined) {
      resolved.ctrl = geometry_msgs.msg.Point.Resolve(msg.ctrl)
    }
    else {
      resolved.ctrl = new geometry_msgs.msg.Point()
    }

    if (msg.next !== undefined) {
      resolved.next = geometry_msgs.msg.Point.Resolve(msg.next)
    }
    else {
      resolved.next = new geometry_msgs.msg.Point()
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0.0
    }

    if (msg.max_acc !== undefined) {
      resolved.max_acc = msg.max_acc;
    }
    else {
      resolved.max_acc = 0.0
    }

    if (msg.acc_per_err !== undefined) {
      resolved.acc_per_err = msg.acc_per_err;
    }
    else {
      resolved.acc_per_err = 0.0
    }

    return resolved;
    }
};

module.exports = ThreePointMsg;
