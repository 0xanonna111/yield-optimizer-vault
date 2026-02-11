// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YieldVault is Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable asset;
    uint256 public totalShares;
    mapping(address => uint256) public shares;

    constructor(address _asset) Ownable(msg.sender) {
        asset = IERC20(_asset);
    }

    function deposit(uint256 _amount) external {
        uint256 _shares;
        if (totalShares == 0) {
            _shares = _amount;
        } else {
            _shares = (_amount * totalShares) / asset.balanceOf(address(this));
        }

        asset.safeTransferFrom(msg.sender, address(this), _amount);
        
        shares[msg.sender] += _shares;
        totalShares += _shares;
    }

    function withdraw(uint256 _shares) external {
        uint256 _amount = (_shares * asset.balanceOf(address(this))) / totalShares;
        
        shares[msg.sender] -= _shares;
        totalShares -= _shares;
        
        asset.safeTransfer(msg.sender, _amount);
    }

    /**
     * @dev Simple harvest mock - in a real scenario, this would interact with
     * external protocols to collect and swap rewards for more 'asset'.
     */
    function harvest() external onlyOwner {
        // Logic to reinvest or compound rewards goes here
    }
}
