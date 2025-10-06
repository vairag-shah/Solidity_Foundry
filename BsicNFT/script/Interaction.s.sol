//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {PNG_NFT} from "../src/PNG_NFT.sol";
import {Script} from "forge-std/Script.sol";
import {DeployPNG_NFT} from "../script/DeployPNG_NFT.s.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";

contract Interaction is Script {
    string public constant tokenURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() public {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "PNG_NFT",
            block.chainid
        );
        mintnftOncontract(mostRecentDeployed);
    }
    function mintnftOncontract(address contractAddress) public {
        vm.startBroadcast();
        PNG_NFT(contractAddress).mint(tokenURI);
        vm.stopBroadcast();
    }
}
