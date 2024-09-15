// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface ITokenFacet {
    function mint(address _to, uint256 _amount) external;
    function transfer(address _to, uint256 _amount) external;
    function balanceOf(address _account) external view returns (uint256);
}
