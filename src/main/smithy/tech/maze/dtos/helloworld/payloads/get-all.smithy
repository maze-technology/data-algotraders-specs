$version: "2"

namespace tech.maze.dtos.helloworld.payloads

use alloy.proto#protoEnabled
use tech.maze.dtos.helloworld.models#Messages

/// Request for GetAll operation
@protoEnabled
structure GetAllRequest {}

/// Response for GetAll operation
@protoEnabled
structure GetAllResponse {
    /// List of hello worlds
    @required
    messages: Messages
}
