// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { ITokenFacet } from "../interfaces/ITokenFacet.sol";

contract TokenFacet is ITokenFacet {
    mapping(address => uint256) public balances;

    function mint(address _to, uint256 _amount) external override {
        balances[_to] += _amount;
    }

    function transfer(address _to, uint256 _amount) external override {
        require(balances[msg.sender] >= _amount, "Not enough balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function balanceOf(address _account) external view override returns (uint256) {
        return balances[_account];
    }
}
