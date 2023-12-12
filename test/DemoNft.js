const {
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Nft", function () {
  async function deployloadFixture() {
    const [deployer, user1] = await ethers.getSigners();

    const factory = await ethers.getContractFactory("Lock");
    const contract = await factory.deploy();

    return { contract, deployer, user1 };
  }

  describe("Deployment", function () {
    it("Deploy", async function () {
      const { contract, deployer, user1 } = await loadFixture(deployloadFixture);
    });
  });
});
