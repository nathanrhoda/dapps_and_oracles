const chai = require('chai');
const chaiAsPromised = require('chai-as-promised');
var Test = require('../config/testConfig.js');

chai.use(chaiAsPromised);
const {expect} = chai;

contract('ExerciseC6A', async (accounts) => {

  var config;
  beforeEach('setup contract', async () => {
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

  it('function call is made when multi-party threshold is reached', async () => {
    
    // ARRANGE
    let admin1 = accounts[1];
    let admin2 = accounts[2];
    let admin3 = accounts[3];
    
    await config.exerciseC6A.registerUser(admin1, true, {from: config.owner});
    await config.exerciseC6A.registerUser(admin2, true, {from: config.owner});
    await config.exerciseC6A.registerUser(admin3, true, {from: config.owner});
        
    let startStatus = await config.exerciseC6A.IsContractPaused(); 
    let changeStatus = !startStatus;

    // ACT
    await config.exerciseC6A.setOperationStatus(changeStatus, {from: admin1});
    await config.exerciseC6A.setOperationStatus(changeStatus, {from: admin2});
    
    
    let newStatus = await config.exerciseC6A.IsContractPaused(); 
    console.log("Status: " + newStatus);

    // ASSERT
    assert.equal(changeStatus, newStatus, "Multi-party call failed");

  });

  it('same admin trying to changestatus twice', async () => {
    
    // ARRANGE
    let admin1 = accounts[1];
    let admin2 = accounts[2];
    let admin3 = accounts[3];
    
    await config.exerciseC6A.registerUser(admin1, true, {from: config.owner});
    await config.exerciseC6A.registerUser(admin2, true, {from: config.owner});
    await config.exerciseC6A.registerUser(admin3, true, {from: config.owner});
        
    let startStatus = await config.exerciseC6A.IsContractPaused(); 
    let changeStatus = !startStatus;

    // ACT
    await config.exerciseC6A.setOperationStatus(changeStatus, {from: admin1});
    
    await expect(
      config.exerciseC6A.setOperationStatus(changeStatus, {from: admin1}))
        .to.be.rejectedWith
        ("Admin has already called this function");
  });
});
