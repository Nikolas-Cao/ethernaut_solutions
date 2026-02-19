pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DetectionBot is IDetectionBot {
    address constant FortaAddress = 0x6DD1298DF95D53Fedf5f9c3c0CE12426622dfE3f;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        IForta(FortaAddress).raiseAlert(owner);
    }
}