// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IOwnershipFacet {
    function transferOwnership(address _newOwner) external;
    function getOwner() external view returns (address);
}
