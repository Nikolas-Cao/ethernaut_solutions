// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {King} from "../src/King.sol";

contract KingScript is Script {
    function run() external {

        vm.startBroadcast();
        King k = new King();
        k.getKingShip{value : 0.001 ether}();
        vm.stopBroadcast();
    }
}
