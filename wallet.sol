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
