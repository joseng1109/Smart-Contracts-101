pragma solidity ^0.5.0;
/// Console Cowboys BlockChain Exploitation Labs Part1 Solidity 5.0 update
/// @title ReEntrancy Lab
/// @author Olie Brown @ficti0n
/// http://cclabs.io

contract Target {

    mapping (address => uint) private balances;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }


    function deposit() public payable  {
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;

    }


    function withdraw(uint withdrawAmount) public {

        require(withdrawAmount <= balances[msg.sender]);
        msg.sender.call.value(withdrawAmount)("");

        balances[msg.sender] -= withdrawAmount;

    }

}