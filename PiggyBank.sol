//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _; 
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external onlyOwner {
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}