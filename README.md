# Census Smart Contract

The Census Smart Contract is an Ethereum-based contract designed to store and manage the population data of citizens. It allows an admin to add and remove citizens, and it provides functionalities to check the total population, number of children, adults, males, and females.

## Features

1. Add citizens with their respective details (alive, age, gender, and address)
2. Check if a citizen is alive
3. View citizen details
4. Check the total population
5. View the list of children
6. Check citizen details based on their address
7. Remove a citizen from the array

## Prerequisites

- Solidity 0.8.12
- Ethereum development environment (e.g., Truffle, Remix, etc.)

## Functions

### Constructor

The constructor initializes the contract and sets the admin to the address deploying the contract.

### Modifiers

`modifier onlyAdmin()`

This modifier ensures that only the admin can access certain functions.

### checkAlive

`function checkAlive(address _isAlive) public view returns(bool)`

This function checks if a citizen is alive based on their address and returns a boolean value.

### addCitizen

`function addCitizen(bool _alive, uint _age, Gender _gender, address _id) public`

This function allows the admin to add a citizen to the contract with their respective details. The citizen is then added to the corresponding arrays (children, adults, males, females, and dead) based on their details.

### viewDetails

`function viewDetails() view public returns(setIdentity[] memory)`

This function returns an array of all the citizens in the contract.

### population

`function population() view public returns(uint)`

This function returns the total number of citizens in the contract.

### viewChildren

`function viewChildren() public view returns(setIdentity[] memory)`

This function returns an array of all the children in the contract.

### checkDetail

`function checkDetail(address _address) public view returns(setIdentity memory)`

This function returns the details of a citizen based on their address.

### deleteArr

`function deleteArr(uint _index) public onlyAdmin`

This function allows the admin to remove a citizen from the array based on their index.

## Usage

1. Deploy the Census Smart Contract to the Ethereum network using your preferred development environment.
2. Interact with the deployed contract by calling the functions to add, remove, or view citizen details and other related information.
3. Make sure only the admin address is allowed to add or remove citizens from the contract.

## License

This smart contract is not licensed and is free for public use.
