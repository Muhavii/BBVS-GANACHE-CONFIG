# Blockchain-Based Voting System

A decentralized voting system built using **React**, **Solidity**, **Truffle**, and **Ganache**. This project leverages blockchain technology to ensure transparency, security, and immutability in the voting process.

---

## Features

- **Admin Panel**:
  - Create and manage elections.
  - Add candidates with optional images.
  - Start and end elections.

- **Voter Panel**:
  - Authenticate using MetaMask.
  - Cast votes securely.
  - View election results.

- **Blockchain Integration**:
  - Smart contracts written in Solidity.
  - Deployed and tested using Truffle and Ganache.
  - Transparent and immutable voting records.

---

### Home Page
![system screenshot](Screenshot%20(99).png)
---
### Login Page
![system screenshot](Screenshot%20(100).png)
---
### User Voting Page
![system screenshot](Screenshot%20(101).png)
---
### View Votes Page 
![system screenshot](Screenshot%20(102).png)
### Features Descripion Page
![system screenshot](Screenshot%20(103).png)

---


## Prerequisites

- **Node.js** (v14 or later)
- **Truffle** (v5.0 or later)
- **Ganache**
- **MetaMask** (browser extension)

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/blockchain-voting-system.git
   cd blockchain-voting-system
   ```

2. Install dependencies for the backend:
   ```bash
   cd backend
   npm install
   ```

3. Install dependencies for the frontend:
   ```bash
   cd ../frontend
   npm install
   ```

---

## Usage

### Backend
1. Start Ganache:
   ```bash
   ganache
   ```

2. Compile and deploy smart contracts:
   ```bash
   truffle compile
   truffle migrate
   ```

3. Start the backend server:
   ```bash
   npm start
   ```

### Frontend
1. Start the React development server:
   ```bash
   npm start
   ```

2. Open the application in your browser:
   ```
   http://localhost:3000
   ```

---

## Project Structure

### Backend
- **`contracts/`**: Contains Solidity smart contracts.
- **`migrations/`**: Deployment scripts for Truffle.
- **`truffle-config.js`**: Configuration file for Truffle.

### Frontend
- **`src/components/`**: React components.
- **`src/pages/`**: Pages for the application.
- **`src/styles/`**: SCSS stylesheets.

---

## Technologies Used

- **Frontend**: React, SCSS
- **Backend**: Node.js, Express
- **Blockchain**: Solidity, Truffle, Ganache
- **Wallet**: MetaMask

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

---

## Contact

For questions or feedback, please contact:
- **Name**: Muteheri Griffins
- **Email**: griffinsmuhavi@gmail.com
- **GitHub**: [Muhavii](https://github.com/your-username)

