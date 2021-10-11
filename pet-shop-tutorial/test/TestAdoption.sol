pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // address of target contract
    Adoption adoption = Adoption(DeployedAddresses.Adoption());
    
    // test adopt()
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // test retrieval of pet owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of expected pet should be this contract.");
    }

    // test retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        //store adopters in memory, not storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of expected pets should be this contract.");
    }

    // id of pet to test
    uint expectedPetId = 8;

    // expected owner of pet should be address(this)
    address expectedAdopter = address(this);
}
