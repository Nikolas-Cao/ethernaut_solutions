// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {DenialHackContract} from "../src/Denial.sol";

contract DenialScript is Script {
    function run() external {
        vm.startBroadcast();
        DenialHackContract dhc = new DenialHackContract();
        
        vm.stopBroadcast();
    }
}
