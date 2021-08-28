const ExerciseC6A = artifacts.require("ExerciseC6A");
const ExerciseC6B = artifacts.require("ExerciseC6B");
const ExerciseC6C = artifacts.require("ExerciseC6C");
const CheckEffectInteraction = artifacts.require("CheckEffectInteraction");
const RateLimiting = artifacts.require("RateLimiting");
const ReentrancyGuard = artifacts.require("ReentrancyGuard");
const ExerciseC6D = artifacts.require("ExerciseC6D");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6A);
    deployer.deploy(ExerciseC6B);
    deployer.deploy(ExerciseC6C);
    deployer.deploy(CheckEffectInteraction);
    deployer.deploy(RateLimiting);
    deployer.deploy(ReentrancyGuard);
    deployer.deploy(ExerciseC6D);    
}