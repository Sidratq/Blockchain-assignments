// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155, Ownable {
    
    uint256 public constant CHARIZARD = 0;
    uint256 public constant IVYSAUR = 1;
    uint256 public constant VENUSAUR = 2;
    
    // mapping (uint256 => string) private _uris;

    constructor() public ERC1155("https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/{id}.json") {
        _mint(msg.sender, CHARIZARD, 250, "");
        _mint(msg.sender, IVYSAUR, 250, "");
        _mint(msg.sender, VENUSAUR, 250, "");
    }

    function uri(uint256 _tokenId) override public view returns (string memory){
        return string(
            abi.encodePacked(
                "https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }


    // from 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // to 0x17F6AD8Ef982297579C203069C1DbfFE4348c372
    // function uri(uint256 tokenId) override public view returns (string memory) {
    //     return(_uris[tokenId]);
    // }
    
    // function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
    //     require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice"); 
    //     _uris[tokenId] = uri; 
    // }
}