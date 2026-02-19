pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {GateKeeperThreeContract} from "../src/GateKeeperThree.sol";

contract GateKeepThreeScript is Script {
    function run() external {
        vm.startBroadcast();
        GateKeeperThreeContract gktc = new GateKeeperThreeContract();
        gktc.hack{value:0.0011 ether}();
        vm.stopBroadcast();
    }
}