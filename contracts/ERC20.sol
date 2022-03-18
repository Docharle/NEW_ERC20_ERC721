// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DOLS is ERC20, Ownable {
    uint256 public tokensPerEth = 1000 * 10 ** decimals();
    mapping(address => uint256) private _balances;

   constructor() ERC20("DOLS", "DLS") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount*tokensPerEth);
    }

  
    function buyTokens(address receiver, uint256 amount) public virtual payable returns (bool) {  
    address owner = _msgSender();
     uint256 amountToBuy = amount * tokensPerEth;
    _transfer(owner, receiver, amountToBuy);
    _balances[receiver] += amount;
     return true;
    }
}