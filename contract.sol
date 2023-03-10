pragma solidity ^0.6.7;

// Import Chainlink Data Feeds contract
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

  // Create a `public` variable named `priceFeed` of type `AggregatorV3Interface`.
  AggregatorV3Interface public priceFeed;
  // Create a constructor
  constructor() public {
    // Instantiate the `AggregatorV3Interface` contract
    priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
  }

  function getLatestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
  }

  function getDecimals() public view returns (uint8) {
    uint8 decimals = priceFeed.decimals();
    return decimals;
  }
}