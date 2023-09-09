// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ruttercoin{

string public tokenName = "ruttercoin";
string public tokenAbbrv = "RTC";

uint public totalsupply = 0;

mapping (address => uint) public balances;

function mint(address _address, uint _amount) public{
    totalsupply  += _amount;
    balances[_address] += _amount;
}


function burn(address _address, uint _amount) public{
    require(balances[_address] >= _amount,"error.transaction cannot proceed");
    totalsupply  -= _amount;  
    balances[_address] -= _amount;
}
}
