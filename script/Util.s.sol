pragma solidity ^0.8.19;

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

function createLevelContract(address levelAddress) {
    Ethernaut factory = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
    factory.createLevelInstance(levelAddress);
}

function submitLevelContract(address levelContractAddress) {
    Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
    e.submitLevelInstance(payable(levelContractAddress));
}