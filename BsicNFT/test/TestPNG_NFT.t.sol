//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {PNG_NFT} from "../src/PNG_NFT.sol";
import {Script} from "forge-std/Script.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Test} from "forge-std/Test.sol";
import {DeployPNG_NFT} from "../script/DeployPNG_NFT.s.sol";

contract TestPNG_NFT is Test, Script, PNG_NFT {
    PNG_NFT public png_nft;
    DeployPNG_NFT public scriptpng_nft;
    address public USER = makeAddr("USER");
    string public constant tokenURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function setUp() public {
        scriptpng_nft = new DeployPNG_NFT();
        png_nft = scriptpng_nft.run();
    }
    function testnamechack() public view {
        string memory expected_name = "Smilly Monkey";
        string memory true_name = png_nft.name();
        assert(
            keccak256(abi.encodePacked(expected_name)) ==
                keccak256(abi.encodePacked(true_name))
        );
    }
    function testaddress_mint() public {
        vm.prank(USER);
        png_nft.mint(tokenURI);
        assert(png_nft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(tokenURI)) ==
                keccak256(abi.encodePacked(png_nft.URI(0)))
        );
    }
}
