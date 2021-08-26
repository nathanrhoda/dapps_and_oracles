// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

// It's important to avoid vulnerabilities due to numeric overflow bugs
// OpenZeppelin's SafeMath library, when used correctly, protects agains such bugs
// More info: https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/2018/november/smart-contract-insecurity-bad-arithmetic/

import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";


contract ExerciseC6CApp {
    using SafeMath for uint256; // Allow SafeMath functions to be called for all uint256 types (similar to "prototype" in Javascript)


    address private contractOwner;              // Account used to deploy contract
    ExerciseC6C exerciseC6C;

    modifier requireContractOwner()
    {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }
    
    constructor
                                (
                                ) 
    {
        contractOwner = msg.sender;
    }


    function calculateBonus
                            (
                                uint256 sales
                            )
                            internal
                            view
                            requireContractOwner
                            returns(uint256)
    {
        if (sales < 100) {
            return sales.mul(5).div(100);
        }
        else if (sales < 500) {
            return sales.mul(7).div(100);
        }
        else {
            return sales.mul(10).div(100);
        }
    }

    function addSale
                                (
                                    string memory id,
                                    uint256 amount
                                )
                                external
                                requireContractOwner
    {
        exerciseC6C.updateEmployee(
                        id,
                        amount,
                        calculateBonus(amount)
        );
    } 
}

abstract contract ExerciseC6C {
    function updateEmployee(string memory id, uint256 sales, uint256 bonus) external virtual ;
}