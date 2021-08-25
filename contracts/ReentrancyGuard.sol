// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract ReentrancyGuard {

    using SafeMath for uint256;

    uint256 private counter = 1;

    modifier reentrancyGuard() {
        counter = counter.add(1);
        uint256 guard = counter;
        _;
        require(guard == counter, "This is not allowed");
    }

    function safeWithdraw(uint256 amount) external reentrancyGuard {

        address payable callerAddress = payable(address(uint160(msg.sender)));     
        callerAddress.transfer(amount);
    }  
}