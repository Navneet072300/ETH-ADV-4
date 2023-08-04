# ETH-ADV-4
The program provided is an example of a smart contract written in Solidity.This smart contract wallet is for every user who wants to “Create a Wallet”.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has a several function like create wallet to create a wallet for user, addBalance to add some tokens, sendfunds to transfer tokens from one wallet to another, balances to check balance of particular wallet. 

## Getting Started

### Executing program

To run this program, we have used Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., wallet.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    mapping(address => uint256) public balances;

    event FundSent(address indexed from, address indexed to, uint256 amount);
    event FundReceived(address indexed from, uint256 amount);

    function createWallet() public {
        // Initialize the wallet with a balance of 0
        balances[msg.sender] = 0;
    }



    function sendFunds(address payable _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit FundSent(msg.sender, _to, _amount);
    }

    receive() external payable {
        balances[msg.sender] += msg.value;
        emit FundReceived(msg.sender, msg.value);
    }

    function addBalance(uint256 _amount) public {
                 balances[msg.sender] = _amount;
    }
}




```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile ethproof.sol" button.
Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ethpintrem" contract from the dropdown menu, and then click on the "Deploy" button.
Once the contract is deployed, you can call the functions create wallet to create a wallet for user, addBalance to add some tokens, sendfunds to transfer tokens from one wallet to another, balances to check balance of particular wallet. 


## Authors

Navneet Shahi 



## License

This project is licensed under the MIT License. You are free to modify and distribute the code for personal and educational purposes.
