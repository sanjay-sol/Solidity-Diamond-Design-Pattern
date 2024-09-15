// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IDiamond {
    function updateFacet(address _facet, bytes4[] calldata _selectors) external;
}
