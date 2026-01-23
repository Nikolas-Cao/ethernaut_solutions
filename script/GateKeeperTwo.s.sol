// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {GateKeeperMediator} from "../src/GateKeeperTwo.sol";

// modifier gateThree(bytes8 _gateKey) {
//     require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
//     _;
// }

contract GateKeeperTwoScript is Script {
    function run() external {
        vm.startBroadcast();
        GateKeeperMediator gkm = new GateKeeperMediator();
        console.log("aaa" , gkm.getResult());
        vm.stopBroadcast();
        
    }
}