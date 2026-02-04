$version: "2"

namespace tech.maze.dtos.helloworld.payloads

use alloy.proto#protoEnabled
use tech.maze.dtos.helloworld.models#Message
use tech.maze.events#event

/// Request for Add operation
@protoEnabled
@event(type: "tech.maze.helloworld.add.request", topic: "helloworld.add.request", version: "1.0.0")
structure AddRequest {
    @required
    @length(min: 1, max: 100)
    content: String
}

/// Response for Add operation
@protoEnabled
@event(type: "tech.maze.helloworld.add.response", version: "1.0.0")
structure AddResponse {
    /// The hello world message
    @required
    message: Message
}
