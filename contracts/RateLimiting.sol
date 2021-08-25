// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract RateLimiting {

    using SafeMath for uint256;

    uint256 private enabled = block.timestamp;

    modifier rateLimit(uint time) {
        require(block.timestamp >= enabled, "Rate Limiting in effect");
        enabled = enabled.add(time);
        _;
    }

    function safeWithdraw(uint256 amount) external rateLimit(30 minutes){

        address payable callerAddress = payable(address(uint160(msg.sender)));     
        callerAddress.transfer(amount);
    }
  

}