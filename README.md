# dapps_and_oracles
CLeaner code 


- Cleaner ways to write a contract 
- How to pause a live contract
- Implement multisig consensus



Multisig is built in to some frameworks and requires that a few private address sign a transaction before it can be committed
Mutisig consensus is implemented into a contract to allow same functionality but its implemented via smart contract code


Payments Protection Patterns

-  Checks - Effects - Interaction
1) Check if all conditions are met and arguments passed are in range
2) Change state variables
3) Interact with other contracts





-  Rate Limiting
 Controls frequency at which a contract operation can occur to minimize loss
 Best implemented as a function modifier that accepts a time parameter

1) Initialize "enabled" variable to current time
2) Require time of call in modifier to be greater than "enabled"
3) Increment "enabled" by time parameter in modifier
4) Use modifier in all rate limiting functions

-  Re-entrancy Guard