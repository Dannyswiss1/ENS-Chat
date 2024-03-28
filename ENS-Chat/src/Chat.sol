// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./IENS.sol";

contract ChatDApp {

    struct Message {
        address sender;
        string message;
        uint256 time;
    }

    address public ensAddress;

    mapping(address => Message[]) private chats;

    event MessageSent(address indexed sender, string message, uint256 time);

    constructor(address _ensAddress) {
        ensAddress = _ensAddress;
    }

    IENS ens = IENS(ensAddress);
    

    function sendMessage(string memory _message) public {

        require(address(ens) == msg.sender, "You don't have an ENS");

        require(bytes(_message).length > 0, "Message content cannot be empty");

        Message memory newMessage = Message({
            sender: msg.sender,
            message: _message,
            time: block.timestamp
        });

        // Add the message to the user's chat history
        chats[msg.sender].push(newMessage);

        emit MessageSent(msg.sender, _message, block.timestamp);
    }

    function getChatHistory(address _user) public view returns (Message[] memory) {
        return chats[_user];
    }
}
