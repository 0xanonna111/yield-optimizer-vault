# Yield Optimizer Vault

A streamlined DeFi vault implementation for yield aggregation. This contract allows users to deposit underlying assets to earn yield through automated strategies. It handles deposit accounting via internal shares and includes a secure harvesting mechanism for compound interest.

## Features
* **Share-Based Accounting:** Accurately tracks user deposits relative to total vault growth.
* **Harvesting Logic:** Professional-level implementation for reinvesting rewards.
* **Access Control:** Restricted functions for strategy management and performance fee collection.
* **Flat Architecture:** Single-layer directory structure for immediate clarity.

## Mechanism
1. **Deposit:** User sends ERC-20 tokens; the vault mints shares.
2. **Strategy:** The vault deploys assets into external protocols (e.g., Aave, Curve).
3. **Harvest:** The strategist triggers reward collection and reinvestment.
4. **Withdraw:** User burns shares to receive their principal plus earned interest.
