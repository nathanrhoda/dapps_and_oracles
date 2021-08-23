
var Test = require('../config/testConfig.js');

contract('ExerciseC6A', async (accounts) => {

  var config;
  before('setup contract', async () => {
    config = await Test.Config(accounts);
  });

  it('contract owner can register new user', async () => {
    
    // ARRANGE
    let caller = accounts[0]; // This should be config.owner or accounts[0] for registering a new user    
    let newUser = config.testAddresses[1]; 

    // ACT
    await config.exerciseC6A.registerUser(newUser, false, {from: caller});
    let result = await config.exerciseC6A.isUserRegistered.call(newUser); 

    // ASSERT
    assert.equal(result, true, "Contract owner cannot register new user");

  });

  it('contract owner can pause a contract', async () => {
    // ARRANGE 
    let pauseContract = true;

    // ACT
    await config.exerciseC6A.setOperationStatus(pauseContract);
    let contractState = await config.exerciseC6A.IsContractPaused();

    // ASSERT
    assert.equal(contractState , pauseContract);
  });
 
});
