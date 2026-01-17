// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MyTelephone} from "../src/MyTelephone.sol";

contract TelephoneScriptContract is Script{


    function run() external {
        vm.startBroadcast();

        // 1. deploy MyTelephone contract on sepolia
        MyTelephone myTele = new MyTelephone();
        // 2. call MyTelephone's changeOwner function
        myTele.changeOwner();

        /* sequence : TelephoneScriptContract -> 
                        MyTelephone(msg.sender = tx.origin = player) ->
                            Telephone(msg.sender = Address(MyTelephone) , tx.origin = player)
        */

        vm.stopBroadcast();
    }
}