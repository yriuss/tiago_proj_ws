// Auto-generated. Do not edit!

// (in-package primeiro_proj.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class situationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type situationRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type situationRequest
    let len;
    let data = new situationRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'primeiro_proj/situationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new situationRequest(null);
    return resolved;
    }
};

class situationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.situation = null;
    }
    else {
      if (initObj.hasOwnProperty('situation')) {
        this.situation = initObj.situation
      }
      else {
        this.situation = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type situationResponse
    // Serialize message field [situation]
    bufferOffset = _serializer.uint8(obj.situation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type situationResponse
    let len;
    let data = new situationResponse(null);
    // Deserialize message field [situation]
    data.situation = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'primeiro_proj/situationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f737e5fcbaaa86f9d9437904e7db66b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 situation # situation of the tiago robot
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new situationResponse(null);
    if (msg.situation !== undefined) {
      resolved.situation = msg.situation;
    }
    else {
      resolved.situation = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: situationRequest,
  Response: situationResponse,
  md5sum() { return 'f737e5fcbaaa86f9d9437904e7db66b6'; },
  datatype() { return 'primeiro_proj/situation'; }
};
