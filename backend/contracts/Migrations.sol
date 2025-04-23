// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // Specify the Solidity version range for this contract

// Define the Migrations contract
contract Migrations {
  // Address of the contract owner (the account that deployed the contract)
  address public owner = msg.sender;

  // Variable to store the ID of the last completed migration
  uint public last_completed_migration;

  // Modifier to restrict access to certain functions
  modifier restricted() {
    // Ensure that only the owner of the contract can call the function
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  // Function to set the ID of the last completed migration
  // Can only be called by the owner of the contract
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed; // Update the last completed migration ID
  }
}
