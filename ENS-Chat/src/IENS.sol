// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IENS {
    function userName(address _user) external view returns (string memory);
    function userAddress(string memory _name) external view returns (address);
    function userImage(address _user) external view returns (string memory);
    function isUserExist(string memory _name) external view returns (bool);
    
    function setUserName(string memory _name) external;
    function setUserAddress(address _address) external;
    function uploadImage(string memory _ipfsHash) external;
}