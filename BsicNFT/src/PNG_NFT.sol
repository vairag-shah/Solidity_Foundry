//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract PNG_NFT is ERC721 {
    uint256 private tokencounter;
    mapping(uint256 => string) private tokenIDtoURI;
    constructor() ERC721("Smilly Monkey", "SM") {
        tokencounter = 0;
    }
    function mint(string memory tokenURI) public {
        tokenIDtoURI[tokencounter] = tokenURI;
        _safeMint(msg.sender, tokencounter);
        tokencounter++;
    }
    function URI(uint256 tokenID) public view returns (string memory) {
        return tokenIDtoURI[tokenID];
    }
    function getContractInfo() public view returns (address, uint256) {
        return (address(this), tokencounter);
    }
}
