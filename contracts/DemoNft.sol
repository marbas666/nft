// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DemoNft is ERC721, Ownable {
    string private _tokenUri;

    constructor(
        string memory name,
        string memory symbol,
        string memory tokenUri
    ) ERC721(name, symbol) Ownable(msg.sender) {
        _tokenUri = tokenUri;
    }

    function mint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function burn(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    function setTokenUri(string memory tokenUri) public onlyOwner {
        _tokenUri = tokenUri;
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireOwned(tokenId);
        return _tokenUri;
    }
}
