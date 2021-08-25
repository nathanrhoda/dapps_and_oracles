// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract CheckEffectInteraction {

using SafeMath for uint256;

mapping(address => uint256) private sales;

    function safeWithdraw(uint256 amount) external {
        // Checks
        require(msg.sender == tx.origin, "Contracts not allowed");
        require(sales[msg.sender] >= amount, "Insufficient funds");


        // Effects
        uint256  amount = sales[msg.sender];
        sales[msg.sender] = sales[msg.sender].sub(amount);
        address payable callerAddress = payable(address(uint160(msg.sender)));


        // Interaction        
        callerAddress.transfer(amount);
    }

    function rateLimiting(uint amount) external {

    }

}