const { ethers } = require("hardhat");

async function main() {
  const Diamond = await ethers.getContractFactory("Diamond");
  const diamond = await Diamond.deploy();
  await diamond.deployed();
  console.log("Diamond deployed to:", diamond.address);

  const OwnershipFacet = await ethers.getContractFactory("OwnershipFacet");
  const ownershipFacet = await OwnershipFacet.deploy();
  await ownershipFacet.deployed();
  console.log("OwnershipFacet deployed to:-", ownershipFacet.address);

  const TokenFacet = await ethers.getContractFactory("TokenFacet");
  const tokenFacet = await TokenFacet.deploy();
  await tokenFacet.deployed();
  console.log("TokenFacet deployed to:-", tokenFacet.address);

  let ownershipSelectors = Object.keys(OwnershipFacet.interface.functions).map(
    (signature) => OwnershipFacet.interface.getSighash(signature)
  );
  await diamond.updateFacet(ownershipFacet.address, ownershipSelectors);
  console.log("OwnershipFacet functions added to Diamond");

  let tokenSelectors = Object.keys(TokenFacet.interface.functions).map(
    (signature) => TokenFacet.interface.getSighash(signature)
  );
  await diamond.updateFacet(tokenFacet.address, tokenSelectors);
  console.log("TokenFacet functions added to Diamond");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
