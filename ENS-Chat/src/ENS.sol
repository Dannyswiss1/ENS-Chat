// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ENS {

    mapping(address => string) public userName;
    mapping(string => address) public userAddress;
    mapping(address => string) public userImage;
    mapping(string => bool) public  isUserExist;

    function setUserName(string memory _name) public {

         if (isUserExist[_name]) {
            revert("The username already exists.");
        }

        userName[msg.sender] = _name;
        isUserExist[_name] = true;
    }

    function setUserAddress(address _address) public {

        require(_address != address(0), "Invalid Address");
        userAddress[userName[msg.sender]] = _address;

    }

     function uploadImage(string memory _ipfsHash) public {
        userImage[msg.sender] = _ipfsHash;
    }

}
