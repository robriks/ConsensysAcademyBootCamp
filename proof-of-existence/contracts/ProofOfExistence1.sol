// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProofOfExistence1 {

  bytes32 public proof;
  
  //get hash of document and store it to global proof bytes variable
  function notarize(string memory document) public {
    proof = proofFor(document);
  }

  //helper function that returns sha256 hash of document
  function proofFor(string memory document) public pure returns (bytes32) {
    return sha256(abi.encodePacked(document));
  }
}
