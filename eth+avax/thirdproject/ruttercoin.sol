// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract rutterCoin is IERC20 {


    uint public totalSupply = 0;
    string public name = "ruttercoin";
    string public symbol = "RC";
    uint8 public decimals = 2;

    address public contractOwner;

    constructor () {
        contractOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "only the contract owner is allowed to perform this operation");
        _;
    }

    mapping (address => uint)  records;

    mapping(address => mapping (address => uint))  allowances;


    function mint(address beneficiary, uint amount) public onlyOwner() {
        records[beneficiary] += amount;
        totalSupply += amount;
        emit Transfer(address(0), beneficiary, amount);
    }

    function burn(uint amount) public {
        records[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    function balanceOf(address anybody) public view returns (uint256 balance) {
        return records[anybody];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf(msg.sender) >= _value, "you don't have enough ruttercoins");
        records[msg.sender] -= _value;
        records[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value; 
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(allowance(_from, msg.sender) >= _value, "you have not been approved to spend from the owner's address");
        require(records[_from] >= _value, "the address you are spending from does not have enough money");
        records[_from] -= _value;
        records[_to] += _value;
        allowances[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
