$version: "2"

namespace tech.maze.dtos.helloworld.models

use alloy.proto#protoEnabled

/// Message entity
@protoEnabled
structure Message {
    /// The unique identifier of the Message
    @required
    id: String

    /// The content of the Message
    @required
    @length(min: 1, max: 100)
    content: String

    /// The creation timestamp of the Message
    @required
    createdAt: Timestamp
}
