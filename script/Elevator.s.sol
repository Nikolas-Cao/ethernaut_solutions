// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {Building} from "../src/Elevator.sol";
import {console} from "../lib/forge-std/src/console.sol";

contract ElevatorScriptContract is Script{
    function run() external {
        vm.startBroadcast();
        Building b = new Building();
        b.goTop();
        vm.stopBroadcast();
    }
}