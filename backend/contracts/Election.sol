// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0; // Specify the Solidity version range for this contract

// Define the Election contract
contract Election {
    // Mapping to store admin addresses (true if the address is an admin)
    mapping(address => bool) admins;

    // Name of the election (e.g., "Presidential Election")
    string name;

    // Description of the election
    string description;

    // Boolean to track if the election has started
    bool started;

    // Boolean to track if the election has ended
    bool ended;

    // Constructor function, executed once when the contract is deployed
    constructor() {
        admins[msg.sender] = true; // Set the deployer of the contract as the first admin
        started = false; // Initialize the election as not started
        ended = false; // Initialize the election as not ended
    }

    // Modifier to restrict access to admin-only functions
    modifier onlyAdmin() {
        // Uncomment the line below to enforce admin-only access
        // require(admins[msg.sender] == true, "Only Admin");
        _;
    }

    // Function to add a new admin
    function addAdmin(address _address) public onlyAdmin {
        admins[_address] = true; // Set the provided address as an admin
    }

    /*****************************CANDIDATES SECTION*****************************/

    // Struct to represent a candidate
    struct Candidate {
        string name; // Candidate's name
        string info; // Additional information about the candidate
        bool exists; // Boolean to check if the candidate exists
    }

    // Mapping to store candidates by their name
    mapping(string => Candidate) public candidates;

    // Array to store the names of all candidates
    string[] candidateNames;

    // Function to add a new candidate
    function addCandidate(string memory _candidateName, string memory _info)
        public
        onlyAdmin
    {
        // Create a new candidate struct
        Candidate memory newCandidate = Candidate({
            name: _candidateName,
            info: _info,
            exists: true
        });

        // Add the candidate to the mapping
        candidates[_candidateName] = newCandidate;

        // Add the candidate's name to the array
        candidateNames.push(_candidateName);
    }

    // Function to get the list of all candidate names
    function getCandidates() public view returns (string[] memory) {
        return candidateNames; // Return the array of candidate names
    }

    /*****************************CANDIDATES SECTION*****************************/

    /*****************************ELECTION SECTION*****************************/

    // Function to set the election details (name and description)
    function setElectionDetails(string memory _name, string memory _description)
        public
        onlyAdmin
    {
        name = _name; // Set the election name
        description = _description; // Set the election description
        started = true; // Mark the election as started
        ended = false; // Ensure the election is not ended
    }

    // Function to get the election name
    function getElectionName() public view returns (string memory) {
        return name; // Return the election name
    }

    // Function to get the election description
    function getElectionDescription() public view returns (string memory) {
        return description; // Return the election description
    }

    // Function to get the total number of candidates
    function getTotalCandidates() public view returns (uint256) {
        return candidateNames.length; // Return the length of the candidateNames array
    }

    /*****************************ELECTION SECTION*****************************/

    /*****************************VOTER SECTION*****************************/

    // Struct to represent a vote
    struct Vote {
        address voterAddress; // Address of the voter
        string voterId; // Unique ID of the voter
        string voterName; // Name of the voter
        string candidate; // Name of the candidate the voter voted for
    }

    // Array to store all votes
    Vote[] votes;

    // Mapping to track if a voter ID has already voted
    mapping(string => bool) public voterIds;

    // Array to store all voter IDs
    string[] votersArray;

    // Function to cast a vote
    function vote(
        string memory _voterId,
        string memory _voterName,
        string memory _candidateName
    ) public {
        require(started == true && ended == false, "Election not running"); // Ensure the election is running
        require(candidates[_candidateName].exists, "No such candidate"); // Ensure the candidate exists
        require(!voterIds[_voterId], "Already Voted"); // Ensure the voter has not already voted

        // Create a new vote struct
        Vote memory newVote = Vote({
            voterAddress: msg.sender,
            voterId: _voterId,
            voterName: _voterName,
            candidate: _candidateName
        });

        // Add the vote to the votes array
        votes.push(newVote);

        // Mark the voter ID as having voted
        voterIds[_voterId] = true;

        // Add the voter ID to the voters array
        votersArray.push(_voterId);
    }

    // Function to get the list of all voter IDs
    function getVoters() public view returns (string[] memory) {
        return votersArray; // Return the array of voter IDs
    }

    /*****************************VOTER SECTION*****************************/

    // Function to get all votes (admin-only)
    function getVotes() public view onlyAdmin returns (Vote[] memory) {
        return votes; // Return the array of votes
    }

    // Function to get the total number of voters
    function getTotalVoter() public view returns (uint256) {
        return votersArray.length; // Return the length of the votersArray
    }

    // Function to end the election
    function endElection() public onlyAdmin {
        require(started == true && ended == false, "Election not running"); // Ensure the election is running

        started = true; // Mark the election as started
        ended = true; // Mark the election as ended
    }

    // Function to reset the election
    function resetElection() public onlyAdmin {
        require(started == true && ended == true, "Election not finished"); // Ensure the election has ended

        // Delete all candidates
        for (uint32 i = 0; i < candidateNames.length; i++) {
            delete candidates[candidateNames[i]];
        }

        // Delete all voter IDs
        for (uint32 i = 0; i < votersArray.length; i++) {
            delete voterIds[votersArray[i]];
        }

        // Reset election details
        name = "";
        description = "";

        // Clear all arrays
        delete votes;
        delete candidateNames;
        delete votersArray;

        // Reset election status
        started = false;
        ended = false;
    }

    // Function to get the election status
    function getStatus() public view returns (string memory) {
        if (started == true && ended == true) {
            return "finished"; // Return "finished" if the election has ended
        }

        if (started == true && ended == false) {
            return "running"; // Return "running" if the election is ongoing
        }

        return "not-started"; // Return "not-started" if the election has not started
    }
}
