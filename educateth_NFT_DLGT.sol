// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CypherpunkNFTV4 is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor(address initialOwner) ERC721("Educateth_DLGT_3.0", "DG") Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT() public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, "https://gateway.lighthouse.storage/ipfs/bafkreiees63v6u2uaibhaqy6el2nvagmkfnezniyaqm2z5aseeoqdsi63y");
        tokenCounter += 1;
        return newTokenId;
    }
}