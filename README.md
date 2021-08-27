# dapps_and_oracles
CLeaner code 


- Cleaner ways to write a contract 
- How to pause a live contract
- Implement multisig consensus



Multisig is built in to some frameworks and requires that a few private address sign a transaction before it can be committed
Mutisig consensus is implemented into a contract to allow same functionality but its implemented via smart contract code


# Payments Protection Patterns

##  Checks - Effects - Interaction
1) Check if all conditions are met and arguments passed are in range
2) Change state variables
3) Interact with other contracts





## Rate Limiting
 Controls frequency at which a contract operation can occur to minimize loss
 Best implemented as a function modifier that accepts a time parameter

1) Initialize "enabled" variable to current time
2) Require time of call in modifier to be greater than "enabled"
3) Increment "enabled" by time parameter in modifier
4) Use modifier in all rate limiting functions

##  Re-entrancy Guard
Prevents a contract from calling itself in a single transaction
Best implemented as a  function modifier

1) Intialize guard counter
2) Increment counter inside modifier
3) set local variable to value of counter
4) Call function ( using placeholder)
5) Require that local variable has the same value as counter



# Security best practices

1) Keep functions private or internal unless they are needed outside your contract
2) Debit before credit to minimize the risk of reentrancy attacks
3) Another contract may use "delegatecall()" to call your contract function. Be aware of this and code defensively
4) For time sensitive operations, keep in mind that "now" is a synonym for "block.timestamp" and can be manipulated by miners
5) Prefix all call to external contracts with untrusted
6) On-chain data is always public. Do not store any sensitive information
7) Do not make state changes in function modifiers. They should only be used for assertions
8) Keep fallback functions short and require msg.data.length equals zero (This is because there is never a time where a payable fallback function requires msg.data.length to be more than zero)
9) Explicitly mark visibility of functions and state variables
10) Does it really need to be on-chain

Good resource for more security specific info 
https://github.com/ConsenSys/smart-contract-best-practices/blob/master/docs/recommendations.md


# Oracle attacks

1) Sybil attacks - Impersonation 1 entity pretends to be many entities
2) Cartel - A group of people collude to create outcomes that favour them
3) Mirroring - Multiple nodes will mirror what others are doing to again tip the balance in their favour
4) Freeloading - Steals data from a oracle and pushes it through as their own with out paying the cost of getting the data
5) Privacy - Takes advantage of data it has access to and uses that to tip the scale in their favour

Influence outcome based on input oracle is providing to smart contracts


# Preventing Oracle attacks

1) Block means of communication with other oracles - No collusion
2) Block ability to identity oracles - Increases security
3) Block ability to see answers submitted by other oracles - Hashing / Ensures every oracle is circulating its own data