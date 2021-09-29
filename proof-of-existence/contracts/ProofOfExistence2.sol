// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProofOfExistence2 {
  bytes32[] private proofs;

  //store proof in contract state
  function storeProof(bytes32 proof) public {
  proofs.push(proof);
  }

  //calculate hash and store proof
  function notarize(string calldata document) external {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  //helper function to get sha256 hash of document
  function proofFor(string memory document) pure public returns (bytes32) {
    return sha256(abi.encodePacked(document));
  }

  //check if document is notarized
  function checkDocument(string memory document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  //helper function to return bool if proof is stored
  function hasProof(bytes32 proof) internal view returns (bool) {
    for (uint256 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}
