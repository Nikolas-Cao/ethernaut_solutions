// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";

interface Vault {
    function unlock(bytes32 _password) external;
}

contract VaultScript is Script {
    function run() external {

        address level = 0x38de31dB0362B9deAa55bcb1Ba98F422878075e3;
        vm.startBroadcast();
        Vault v = Vault(level);
        // this _password is get from etherscan , the contract creation transaction input data
        // there have `internal Txns` , get internal creation transaction .
        // the input is the `contract byte code` + `constructor params`
        // the `contract byte code` can be find via contract's address in etherscan .
        // so it is easy to extract `constructor params`
        v.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        vm.stopBroadcast();
    }
}