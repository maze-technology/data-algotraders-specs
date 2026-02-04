$version: "2"
namespace tech.maze.dtos.algotraders.main.proto

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
  ohlcv: OHLCV
}

structure AlgoTrader {
  id: Long
  host: String
  port: String
  createdAt: Timestamp
  strategies: AlgoTraderStrategiesList
}

structure AlgoTraderStrategy {
  algoTrader: AlgoTrader
  identifier: String
  version: String
  host: String
  port: String
}

structure AlgoTraderOpportunity {
}

structure AddAlgoTraderRequest {
  algoTrader: AlgoTrader
}

structure AddAlgoTraderResponse {
  algoTrader: AlgoTrader
}

structure FilterAlgoTraderById {
  id: Long
}

structure FilterAlgoTraderByHostAndPort {
}

structure AlgoTraderFragment {
  filter: AlgoTraderFragmentFilter
}

structure AlgoTradersFragment {
}

structure FindOneAlgoTraderByFragmentRequest {
  fragment: AlgoTraderFragment
}

structure FindOneAlgoTraderByFragmentResponse {
  algoTrader: AlgoTrader
}

structure FindAlgoTradersByFragmentRequest {
  fragment: AlgoTradersFragment
}

structure FindAlgoTradersByFragmentResponse {
  algoTraders: FindAlgoTradersByFragmentResponseAlgoTradersList
}

structure AlgoTraderDescribeRequest {
}

structure AlgoTraderDescribeResponse {
  strategies: AlgoTraderDescribeResponseStrategiesList
}

structure AlgoTraderStrategyEventRequest {
  event: AlgoTraderStrategyEventRequestEvent
}

structure AlgoTraderStrategyEventResponse {
  opportunities: AlgoTraderStrategyEventResponseOpportunitiesList
}
