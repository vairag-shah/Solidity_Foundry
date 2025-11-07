//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract RedWolf2 {
    IERC20 public token;
    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }
    function transferTokens(address to, uint256 amount) external {
        require(token.transfer(to, amount), "Transfer failed");
    }
}
