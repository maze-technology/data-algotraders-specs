$version: "2"

namespace tech.maze.dtos.algotraders.main.proto

use smithy.api#Document
use smithy.api#Timestamp

list AlgoTraderStrategiesList {
    member: AlgoTraderStrategy
}

list FindAlgoTradersByFragmentResponseAlgoTradersList {
    member: AlgoTrader
}

list AlgoTraderDescribeResponseStrategiesList {
    member: AlgoTraderStrategy
}

list AlgoTraderStrategyEventResponseOpportunitiesList {
    member: AlgoTraderOpportunity
}

union AlgoTraderFragmentFilter {
    byId: FilterAlgoTraderById
    byHostAndPort: FilterAlgoTraderByHostAndPort
}

union AlgoTraderStrategyEventRequestEvent {
    ohlcv: Document
}

structure AlgoTrader {
    @required
    id: Long

    @required
    host: String
    
    @required
    port: String
    
    @required
    strategies: AlgoTraderStrategiesList
    
    @required
    createdAt: Timestamp
}

structure AlgoTraderStrategy {
    @required
    algoTrader: AlgoTrader
    
    @required
    identifier: String
    
    @required
    version: String
    
    @required
    host: String
    
    @required
    port: String

    @required
    createdAt: Timestamp
}

structure AlgoTraderOpportunity {}

structure AddAlgoTraderRequest {
    @required
    algoTrader: AlgoTrader
}

structure AddAlgoTraderResponse {
    @required
    algoTrader: AlgoTrader
}

structure FilterAlgoTraderById {
    @required
    id: Long
}

structure FilterAlgoTraderByHostAndPort {}

structure AlgoTraderFragment {
    @required
    filter: AlgoTraderFragmentFilter
}

structure AlgoTradersFragment {}

structure FindOneAlgoTraderByFragmentRequest {
    @required
    fragment: AlgoTraderFragment
}

structure FindOneAlgoTraderByFragmentResponse {
    @required
    algoTrader: AlgoTrader
}

structure FindAlgoTradersByFragmentRequest {
    @required
    fragment: AlgoTradersFragment
}

structure FindAlgoTradersByFragmentResponse {
    @required
    algoTraders: FindAlgoTradersByFragmentResponseAlgoTradersList
}

structure AlgoTraderDescribeRequest {}

structure AlgoTraderDescribeResponse {
    @required
    strategies: AlgoTraderDescribeResponseStrategiesList
}

structure AlgoTraderStrategyEventRequest {
    @required
    event: AlgoTraderStrategyEventRequestEvent
}

structure AlgoTraderStrategyEventResponse {
    @required
    opportunities: AlgoTraderStrategyEventResponseOpportunitiesList
}
