  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bank {

    address public bankmanager;

    constructor ()  {
        bankmanager = msg.sender ;
    }
    
    mapping (address => uint) public accountBalances;

    //deposit and withdraw
    function deposit () public payable {
        if (msg.value % 0.001 ether != 0){

            //revert
            revert("allow only deposit of multiples of 0.001 ether");
        }

     accountBalances[msg.sender] += msg.value/ 0.001 ether;
    }

    function withdraw (uint amount) public payable {

        //require
     require(accountBalances[msg.sender] >= amount, "not enough balance");

        accountBalances[msg.sender] -= amount;
        bool sent = payable (msg.sender).send(amount *0.001 ether);

        //assert
        assert(sent);

    }

}
