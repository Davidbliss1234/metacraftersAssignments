
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DEGEN {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    uint public totalSupply = 0;
    string public name = "DEGEN";
    string public symbol = "DG";
    uint8 public decimals = 0;

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
        require(balanceOf(msg.sender) >= _value, "you don't have enough DEGEN");
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

    mapping(address => uint) playerLives;
    mapping(address => bool)  public isImmortal;

    function buylives(uint numberOfLives) public {
        require (balanceOf(msg.sender) >= (20*numberOfLives),"you can't afford that many lives");
        require((playerLives[msg.sender] + numberOfLives) <= 5, "you are not allowed to own more than 5 lives at a time");
        playerLives[msg.sender] += numberOfLives;
        burn(20*numberOfLives);
    }
    function sageMode() public {
        require (balanceOf(msg.sender) >= 1000000,"only the bravest warriors become sages");
        isImmortal[msg.sender] = true;
        burn(1000000);
    }

    function checkLives(address player) public view returns (uint) {
        return playerLives[player];
    }
}
