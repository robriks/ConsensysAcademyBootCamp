//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    string public name = "Big Dick Token";
    string public symbol = "BDT";
    uint public totalSupply = 1000000;
    mapping(address => uint) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient BDT balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) public view returns (uint) {
        return balances[account];
    }
}
