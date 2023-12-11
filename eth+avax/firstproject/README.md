# Simple Bank Smart Contract

This Solidity smart contract represents a basic bank that allows users to deposit and withdraw funds in multiples of 0.001 ether.

## Features

Deposit Functionality: Users can deposit multiples of 0.001 ether into their account balances.
Withdraw Functionality: Users can withdraw funds from their account balances, provided they have enough balance.

## Getting Started

To interact with this smart contract:

Deploy the Contract: Deploy the bank.sol Solidity contract to your preferred Ethereum development environment or network.

Deposit Funds: Use the deposit() function to add multiples of 0.001 ether to your account balance.

Withdraw Funds: Utilize the withdraw(uint amount) function to withdraw a specific amount of ether from your account balance. Ensure the amount is within your account balance.

## Usage

Ensure your deposit amounts are multiples of 0.001 ether to avoid transaction revert.
Verify your account balance before making withdrawal requests to prevent insufficient balance errors.


## Smart Contract Details

bankmanager: Address of the manager who deploys the contract.
accountBalances: Mapping storing account balances for each address.
deposit(): Function to deposit multiples of 0.001 ether into an account.
withdraw(uint amount): Function to withdraw a specified amount from an account balance.

## License

This project is licensed under the MIT License
