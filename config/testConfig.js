
var ExerciseC6A = artifacts.require("ExerciseC6A");

var Config = async function(accounts) {
    
    // These test addresses are useful when you need to add
    // multiple users in test scripts
    let testAddresses = [
        "0xDae9897a1Cf794d11B0459AD11bcC36eec3ef49d",
        "0x3fE7E1380002b882F673367378263AEA454A4DbC",
        "0x3Ca8a4c747BFa2C961dE2e6Bf65b52403dfFAC7b",
        "0xB9B7925f7111595977f727E9Cb5F3213bBcc5C78",
        "0x61366A0c0CD65d78c6C2b5a577D6B6286D28Cf7E",
        "0xf2dCd73016cC43BF31431b5Ea4ceb2477f886025",        
        "0xAbcd49cE8902D165a675cFF3EDCe7C865b7aF420",
        "0x4B66df541B916FA0C0c5d00D1d45a3e41EB594B7",
        "0x8916d36A5eBBaDbeb04ff0dEeB8cbF22da5038a1"
    ];


    let owner = accounts[0];
    let exerciseC6A = await ExerciseC6A.new();
    
    return {
        owner: owner,
        testAddresses: testAddresses,
        exerciseC6A: exerciseC6A
    }
}

module.exports = {
    Config: Config
};