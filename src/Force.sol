// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ForceMediator {
    // call by EOA and send all balance to level contract
    function selfKill(address target) external payable {
        selfdestruct(payable(target));
    }
}