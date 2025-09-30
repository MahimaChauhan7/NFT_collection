// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18; 
import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
contract BasicNFTTest is Test {
    address public USER = makeAddr("user");
      string public constant PUG =
      "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    // the deployBasic contract 
    DeployBasicNft public deployer; 
    BasicNFT public basicNft; 
    function setUp() public {
        deployer = new DeployBasicNft(); 
        basicNft = BasicNFT(address(deployer.run()));
        
    }
    function testNameofCoin() public view {
        // name of the nft 
        string memory expected = "BasicNFT"; 
        // name from deployed one 
        string memory actual = basicNft.name();
        assert(keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(actual)));
    }
    // Test for user mint and then chage the user's balance 
    //first we need the tokenuri which is PUG in our case 
    function testCanMintAndHaveABalance() public {
    vm.prank(USER);
    basicNft.mintNFT(PUG);

    assert(basicNft.balanceOf(USER) == 1);
    assert(
        keccak256(abi.encodePacked(PUG)) 
        == keccak256(abi.encodePacked(basicNft.tokenURI(0)))
    );
}



}
