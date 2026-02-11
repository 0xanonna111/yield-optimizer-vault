const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  
  // Example: Deploying a vault for a mock USDC/DAI address
  const MOCK_ASSET_ADDR = "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48"; 
  
  const vault = await hre.ethers.deployContract("YieldVault", [MOCK_ASSET_ADDR]);

  await vault.waitForDeployment();
  console.log("Yield Vault deployed to:", await vault.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
