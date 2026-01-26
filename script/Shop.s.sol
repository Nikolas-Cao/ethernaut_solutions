// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {Buyer , Shop} from "../src/Shop.sol";


contract ShopScript is Script {
    function run() external {
        vm.startBroadcast();

        Buyer b = new Buyer();
        b.buy();

        Shop s = Shop(0x3eE47fec4dcBEAF54Df1c897978EeE12f6c9889A);
        console.log("price is : ", s.price());

        vm.stopBroadcast();
    }
}
