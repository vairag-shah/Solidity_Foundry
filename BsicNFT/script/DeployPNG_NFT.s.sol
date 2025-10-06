//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
//import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {PNG_NFT} from "../src/PNG_NFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployPNG_NFT is Script {
    /* function deploy() public returns (PNG_NFT) {
        PNG_NFT png_nft = new PNG_NFT();
        return png_nft;
    }

    function setup() public {}*/
    function run() public returns (PNG_NFT) {
        vm.startBroadcast();
        PNG_NFT png_nft = new PNG_NFT();
        vm.stopBroadcast();
        return png_nft;
        // Import or declare the VM cheatcode interface for Foundry
        // Example: Vm vm = Vm(address(uint160(uint256(keccak256('hevm cheat code')))));
        // Or import "forge-std/Script.sol" and inherit Script
    }
}
