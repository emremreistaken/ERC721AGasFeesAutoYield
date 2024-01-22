// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721AGasFeesAutoYield.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Example721A_GFAY is ERC721AGasFeesAutoYield, Ownable {

    constructor(string memory _name, string memory _symbol) ERC721AGasFeesAutoYield(_name, _symbol) {}

    function mint(uint quantity){
      _safeMint(msg.sender, quantity);
    }

    function claimAllGas(address recipient) external onlyOwner {
      _claimAllGas(address(this), recipient);
    }

    function claimMaxGas(address recipient) external onlyOwner {
      _claimMaxGas(address(this), recipient);
    }

    function claimGasAtMinClaimRate(address recipient, uint minClaimRateBips) external onlyOwner {
      _claimGasAtMinClaimRate(address(this), recipient, minClaimRateBips);
    }

    function claimGas(address recipient, uint256 gasToClaim, uint256 gasSecondsToConsume) external onlyOwner {
      _claimGas(address(this), recipient, gasToClaim, gasSecondsToConsume);
    }

    function withdraw() external onlyOwner {
      (bool success, ) = msg.sender.call{value: address(this).balance}("");
      require(success, "transfer failed");
    }

    receive() external payable {}
}