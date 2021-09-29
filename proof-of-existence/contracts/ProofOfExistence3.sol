// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProofOfExistence3 {
  
  mapping (bytes32 => bool) private proofs;

  // store proof of existence in state
  function storeProof(bytes32 proof) internal {
    proofs[proof] = true;
  }

  //calculate and store proof of document
  function notarize(string calldata document) external {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }
  
  //helper function to get sha256
  function proofFor(string memory document) pure public returns (bytes32) {
    return keccak256(bytes(document));
  }

  //check if document has been notarized
  function checkDocument(string memory document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }
    
  //helper function returns true if proof is stored in mapping  
  function hasProof(bytes32 proof) internal view returns (bool) {
    return proofs[proof];
  }
}
