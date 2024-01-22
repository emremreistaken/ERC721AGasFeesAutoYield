// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "../interfaces/IBlast.sol";

contract ERC721AGasFeesAutoYield is ERC721A {
    // Smart contracts must interact with the Blast contract to change their Gas Mode.
    address blastYieldContract = 0x4300000000000000000000000000000000000002;

    constructor(string memory name_, string memory symbol_) ERC721A (name_, symbol_) {
      IBlast(blastYieldContract).configureAutomaticYield();
      IBlast(blastYieldContract).configureClaimableGas();
    }

    function _claimAllGas(address contractAddress, address recipient) internal {
      IBlast(blastYieldContract).claimAllGas(contractAddress, recipient);
    }

    function _claimMaxGas(address contractAddress, address recipient) internal {
      IBlast(blastYieldContract).claimMaxGas(contractAddress, recipient);
    }

    function _claimGasAtMinClaimRate(address contractAddress, address recipient, uint minClaimRateBips) internal {
      IBlast(blastYieldContract).claimGasAtMinClaimRate(contractAddress, recipient, minClaimRateBips);
    }

    function _claimGas(address contractAddress, address recipient, uint256 gasToClaim, uint256 gasSecondsToConsume) internal {
      IBlast(blastYieldContract).claimGas(contractAddress, recipient, gasToClaim, gasSecondsToConsume);
    }
}
