//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract ETHWallet {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not called by Owner");
        _;
    }

    modifier sufficientAmount(uint256 _amount) {
        require(_amount <= address(this).balance, "Not sufficient balance");
        _;
    }

    receive() external payable {}

    function sendETH(address _to, uint256 _amount) external payable onlyOwner sufficientAmount(_amount) {
        payable(_to).transfer(_amount);
    }

    function getBalance() external onlyOwner view returns (uint) {
        return address(this).balance;
    }

    function withdraw(uint256 _amount) external payable onlyOwner sufficientAmount(_amount) {
        payable(msg.sender).transfer(_amount);
    }
}
