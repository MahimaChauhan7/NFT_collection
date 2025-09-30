// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18; 
import {Script} from "forge-std/Script.sol";
// Make sure the contract name matches the one defined in BasicNft.sol
import {BasicNFT} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script{
    string public constant TOKENURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
function run() external {
        // Use the deployed contract address from Sepolia deployment
        address mostRecentlyDeployed = 0x3ED0227fE58A60b93234D9ffAe31078F84d8EC3F;
        mintNftOncontract(mostRecentlyDeployed);
    }
    // function where contractaddress is minting 
    function mintNftOncontract(address contractAddress) public {
        vm.startBroadcast(); 
        BasicNFT(contractAddress).mintNFT(TOKENURI);
        vm.stopBroadcast(); 
    }
}
