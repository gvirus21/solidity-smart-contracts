//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Ownable {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Can only be called by Owner");
        _;
    }

    function canOnlyBeCalledByOwner() external onlyOwner view returns (string memory) {
        return "Function called";
    }

    function setOwner( address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

}