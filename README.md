# Solidity Diamond Pattern Example

## Table of Contents
- [Solidity Diamond Pattern Example](#solidity-diamond-pattern-example)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Diagram and overview](#diagram-and-overview)
  - [Diamond Proxy Pattern Overview](#diamond-proxy-pattern-overview)
    - [Key Components](#key-components)
    - [How It Works](#how-it-works)
  - [Project Structure](#project-structure)
    - [Description of Files](#description-of-files)
  - [Deployment](#deployment)
  - [How It Works](#how-it-works-1)
  - [Storage Slots](#storage-slots)
    - [How Function Delegation Works](#how-function-delegation-works)
  - [Additional Resources](#additional-resources)

## Introduction
This project demonstrates the Solidity Diamond Pattern, a design pattern that allows for modular and upgradable smart contracts. The Diamond Pattern is used to split a contract into multiple facets, each handling specific functionalities, while a central Diamond contract delegates calls to these facets.

## Diagram and overview
![Screenshot 2024-09-15 at 6 21 29 AM](https://github.com/user-attachments/assets/19ad3e19-f7f2-4804-b100-3066be164796)

## Diamond Proxy Pattern Overview
The Diamond Pattern, also known as the Diamond Proxy Pattern, is a way to manage complex smart contracts in a modular and upgradeable manner. This pattern allows you to:

- **Modularize Functionality**: Split a contract's functionality into multiple facets, each implemented in separate contracts.
- **Upgrade Functionality**: Update or replace facets without altering the core Diamond contract, making the system flexible and scalable.

### Key Components
1. **Diamond Contract**: Central contract that manages function dispatching and facet updates.
2. **Facets**: Separate contracts implementing specific functionalities. Each facet can be upgraded independently.
3. **Function Selectors**: Used to determine which facet handles a particular function call. 

### How It Works
1. **Function Call Delegation**: The Diamond contract uses a fallback function to delegate calls to the appropriate facet based on the function selector (hash of the function signature).
2. **Facet Registration**: Facets are registered with the Diamond contract along with their function selectors. When a function call is made, the Diamond contract looks up the selector to determine which facet should handle the call.
3. **Upgradeability**: New facets can be added or existing ones updated by modifying the facet-to-selector mapping in the Diamond contract.

## Project Structure
The project is organized into the following structure:

contracts/
  - facets/
    - OwnershipFacet.sol
    - TokenFacet.sol
  - interfaces/
    - IDiamond.sol
    - IOwnershipFacet.sol
    - ITokenFacet.sol
  - Diamond.sol
scripts/
  - deploy.js


### Description of Files

- **Diamond.sol**: The central contract that manages facets and delegates function calls.
- **OwnershipFacet.sol**: A facet handling ownership management functions.
- **TokenFacet.sol**: A facet managing token-related functions.
- **interfaces/**: Contains interfaces defining the functions exposed by the Diamond and facets.
- **deploy.js**: Deployment script using Hardhat to deploy the Diamond contract and facets, and register function selectors.

## Deployment
The deployment script (`deploy.js`) uses Hardhat to:
1. Deploy the Diamond contract.
2. Deploy facets (`OwnershipFacet` and `TokenFacet`).
3. Register the function selectors of each facet with the Diamond contract.

## How It Works
1. **Deployment**: Deploy the Diamond contract and facets. Register the function selectors of each facet in the Diamond contract.
2. **Function Calls**: When a function call is made, the Diamond contract uses the fallback function to delegate the call to the appropriate facet based on the function selector.
3. **Facet Management**: Facets can be updated or replaced by updating the function selector mappings in the Diamond contract.

## Storage Slots
The Diamond Pattern leverages storage slots to manage state efficiently:
- **Diamond Storage**: The Diamond contract uses a mapping to store the address of each facet associated with function selectors.
- **Facet Storage**: Each facet maintains its own state, which is managed independently of other facets.


### How Function Delegation Works
1. **Function Selector Lookup**: Diamond contract looks up the function selector.
2. **Facet Invocation**: Calls the appropriate facet based on the function selector.

## Additional Resources
- [EIP Link](https://eips.ethereum.org/EIPS/eip-2535)

