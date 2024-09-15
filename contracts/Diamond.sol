// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { IDiamond } from "./interfaces/IDiamond.sol";

contract Diamond {
    // A mapping to store which facet handles which function selectors
    mapping(bytes4 => address) public facets;

    event FacetUpdated(address indexed facet, bytes4[] selectors);

    // Function to add or replace a facet and its function selectors
    function updateFacet(address _facet, bytes4[] calldata _selectors) external {
        for (uint256 i = 0; i < _selectors.length; i++) {
            facets[_selectors[i]] = _facet;
        }
        emit FacetUpdated(_facet, _selectors);
    }

    // Thisi fallback function is used to delegate calls to the appropriate facet
    fallback() external payable {
        address facet = facets[msg.sig];
        require(facet != address(0), "Diamond: Function does not exist");
        (bool success, ) = facet.delegatecall(msg.data);
        require(success, "Diamond: Delegatecall failed");
    }

    receive() external payable {}
}
