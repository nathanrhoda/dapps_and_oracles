const ExerciseC6A = artifacts.require("ExerciseC6A");
const ExerciseC6B = artifacts.require("ExerciseC6B");
const CheckEffectInteraction = artifacts.require("CheckEffectInteraction");
const RateLimiting = artifacts.require("RateLimiting");
const ReentrancyGuard = artifacts.require("ReentrancyGuard");


module.exports = function(deployer) {

    deployer.deploy(ExerciseC6A);
    deployer.deploy(ExerciseC6B);
    deployer.deploy(CheckEffectInteraction);
    deployer.deploy(RateLimiting);
    deployer.deploy(ReentrancyGuard);
}