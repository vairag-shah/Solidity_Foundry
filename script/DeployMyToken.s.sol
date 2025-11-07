// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerKey);

        MyToken token = new MyToken(1_000_000 * 10 ** 18);
        console.log("MyToken deployed at:", address(token));

        vm.stopBroadcast();
    }
}
