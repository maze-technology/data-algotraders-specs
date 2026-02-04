$version: "2"

namespace tech.maze.dtos.helloworld.controllers

use alloy.proto#protoEnabled
use tech.maze.dtos.helloworld.payloads#GetAllRequest
use tech.maze.dtos.helloworld.payloads#GetAllResponse

/// Service for handling Hello World gRPC operations
@protoEnabled
service HelloWorld {
    version: "1.0.0"
    operations: [
        GetAll
    ]
}

/// Operation to get all Hello World messages
@readonly
operation GetAll {
    input: GetAllRequest
    output: GetAllResponse
}
