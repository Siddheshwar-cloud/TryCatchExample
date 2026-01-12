const hre = require("hardhat");

async function main() {

    const TryCatchExample = await hre.ethers.getContractFactory("TryCatchExample");
    const tryCatch = await TryCatchExample.deploy();

    await tryCatch.waitForDeployment();

    console.log("TryCatchExample deployed to:", await tryCatch.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
