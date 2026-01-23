// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface GateKeeper {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperOneMediator {
    function enter(uint256 gasValue, bytes8 _gateKey) external returns(bool) {
        address levelContractAddress = 0x9b2F415AB483c54321fCEa3eA510E7aa92d58e1c;
        GateKeeper g = GateKeeper(levelContractAddress);
        return g.enter{gas : gasValue}(_gateKey);
    }
}