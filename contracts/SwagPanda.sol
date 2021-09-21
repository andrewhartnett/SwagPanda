// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract SwagPanda is ERC721Enumerable, ReentrancyGuard, Ownable {

    uint256 public _currentTokenId = 1;
    uint256 public costToMint = 10000000000000000;

    function tokenURI(uint256 tokenId) override public pure returns (string memory) {
        return string(abi.encodePacked("https://swagpanda.s3.amazonaws.com/meta/", Strings.toString((tokenId)), '.json'));
    }

    /**
     * @dev increments the value of _currentTokenId
     */
    function _incrementTokenId() private {
        _currentTokenId++;
    }

    function claim(uint256 _tokenId) payable public nonReentrant {
        require(_tokenId < 2050, "tokenId invalid");
        require(msg.value >= costToMint, 'less than costToMint');
        _safeMint(_msgSender(), _currentTokenId);
        _incrementTokenId();
    }

    function ownerClaim() public nonReentrant onlyOwner {
        require(_currentTokenId < 4201, "Token invalid");
        _safeMint(owner(), _currentTokenId);
        _incrementTokenId();
    }

    function setCostToMint(uint256 _costToMint) public onlyOwner {
        costToMint = _costToMint;
    }
      
    constructor() ERC721("Swag Panda", "Swag Panda") Ownable() {}
}