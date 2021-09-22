// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract SwagPanda is ERC721Enumerable, ReentrancyGuard, Ownable {

    uint256 public _currentTokenId = 1;
    uint256 public costToMint = 10000000000000000;
    uint256 public supply = 1000;

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
        require(_tokenId < supply, "tokenId invalid");
        require(msg.value >= costToMint, 'less than costToMint');
        _safeMint(_msgSender(), _currentTokenId);
        _incrementTokenId();
    }

    function ownerClaim(address _address) public nonReentrant onlyOwner {
        require(_currentTokenId < supply, "Token invalid");
        _safeMint(_address, _currentTokenId);
        _incrementTokenId();
    }

    function setCostToMint(uint256 _costToMint) public onlyOwner {
        costToMint = _costToMint;
    }

    function setSupply(uint256 _supply) public onlyOwner {
        supply = _supply;
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
      
    constructor() ERC721("Swag Panda", "SwagPanda") Ownable() {}
}