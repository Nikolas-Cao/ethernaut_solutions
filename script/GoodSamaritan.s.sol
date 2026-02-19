pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {NotifyContract} from "../src/GoodSamaritan.sol";

contract GoodSamaritanScript is Script {
    function run() external {
        vm.startBroadcast();
        NotifyContract nc = new NotifyContract();
        bool enough = nc.hack();
        vm.stopBroadcast();
    }
}