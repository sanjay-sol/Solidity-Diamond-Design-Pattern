// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { IOwnershipFacet } from "../interfaces/IOwnershipFacet.sol";

contract OwnershipFacet is IOwnershipFacet {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address _newOwner) external override onlyOwner {
        require(_newOwner != address(0), "Invalid new owner");
        owner = _newOwner;
    }

    function getOwner() external view override returns (address) {
        return owner;
    }
}
