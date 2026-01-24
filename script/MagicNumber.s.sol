// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";

interface Solver {
    function whatIsTheMeaningOfLife() external returns (bytes32 result);
}

interface MagicNum  {
    function setSolver(address _solver) external;
}

contract MagicNumberScript is Script {
    function run() external {
        // 1. verify if it works fine
        vm.startBroadcast();
        address deployedAddress = 0xE617407cDc95C486E794e60Cd34e2Dd80Fa8064e;
        Solver s = Solver(deployedAddress);
        console.log("what is meaning of life : " , uint256(s.whatIsTheMeaningOfLife()));
        require(s.whatIsTheMeaningOfLife() == bytes32(uint256(0x2a)) , "value is not expected");

        address levelContractAddress = 0x3775FCea76B2466c6D2E2255260E1664954172A2;
        MagicNum mn = MagicNum(levelContractAddress);
        mn.setSolver(deployedAddress);
        vm.stopBroadcast();
    }
}
