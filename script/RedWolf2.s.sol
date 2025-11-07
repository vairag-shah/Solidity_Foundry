// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {RedWolf2} from "src/RedWolf2.sol";
import {Script} from "forge-std/Script.sol";
contract RedWolf2Script is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");
        address to = vm.envAddress("TO_ADDRESS");

        address tokenAddress = vm.envAddress("TOKEN_ADDRESS");

        vm.startBroadcast(deployerKey);

        RedWolf2 redWolf = new RedWolf2(tokenAddress);

        // Transfer 1,000,000 tokens to the TO_ADDRESS
        redWolf.transferTokens(to, 1_000_000 * 10 ** 18);

        vm.stopBroadcast();
    }
}
