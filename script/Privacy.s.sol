// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";

interface Privacy {
    function unlock(bytes16 _key) external;
}

contract PrivacyScriptContract is Script {
    function run() external {
        vm.startBroadcast();
        address levelContractAddress = 0xaD410B06D4339eA79AEBB1c7b10cf4Ca79a8a8Ca;
        Privacy p = Privacy(levelContractAddress);
        p.unlock(0xc17ffcbf51f1cdbb75645e0e2dea162b);
        vm.stopBroadcast();
    }
}