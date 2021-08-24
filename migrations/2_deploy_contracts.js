const ExerciseC6A = artifacts.require("ExerciseC6A");
const ExerciseC6B = artifacts.require("ExerciseC6B");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6A);
    deployer.deploy(ExerciseC6B);
}