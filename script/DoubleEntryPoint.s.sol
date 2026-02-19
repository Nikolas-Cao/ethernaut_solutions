pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {IForta, DetectionBot} from "../src/DoubleEntryPoint.sol";

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}

contract DoubleEntryPointScript is Script {
    address constant FortaAddress = 0x6DD1298DF95D53Fedf5f9c3c0CE12426622dfE3f;

    function run() external {
        vm.startBroadcast();
        DetectionBot db = new DetectionBot();
        IForta(FortaAddress).setDetectionBot(address(db));
        vm.stopBroadcast();
    }
}
