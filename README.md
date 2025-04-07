# VotingContract – Solidity Smart Contract for Decentralized Voting

This repository contains the smart contract used in a decentralized voting system. The contract is written in Solidity and designed to be deployed on any EVM-compatible blockchain.

## 📄 Contract Overview

The contract allows the creation of voting questions with two possible options and enables users to vote on them. It tracks the vote counts transparently and stores data on-chain.

### ✅ Main Features

- Create voting questions with two options
- Vote on a question (option 1 or 2)
- Retrieve vote counts for each option
- Get the full content of any question

### 🔐 Security Validations

- Votes can only be cast for valid question IDs
- Only option `1` or `2` is accepted
- Internal state is fully auditable on-chain

---

## 🧠 Data Structures

```solidity
struct Question {
    string questionText;
    string option1;
    string option2;
    uint256 votesOption1;
    uint256 votesOption2;
}

mapping(uint256 => Question) public questions;
uint256 public questionCount;
```

---

## 🔧 Functions

### createQuestion

```solidity
function createQuestion(string memory _questionText, string memory _option1, string memory _option2) external;
```

Creates a new question and stores it in the `questions` mapping.

### vote

```solidity
function vote(uint256 _questionId, uint256 _option) external;
```

Casts a vote for option 1 or 2 on a given question.

### getVotes

```solidity
function getVotes(uint256 _questionId, uint256 _option) external view returns (uint256);
```

Returns the number of votes for a given option.

### getQuestion

```solidity
function getQuestion(uint256 _questionId) external view returns (string memory, string memory, string memory);
```

Returns the full question text and both options.

---

## 🧪 Deployment and Testing

You can deploy this contract using:

- [Remix IDE](https://remix.ethereum.org/)
- Hardhat (recommended for local testing)
- Truffle
- Any Web3-compatible toolset

---

## 🔗 Integration

This contract is used by the frontend Web3 interface in the companion project:  
🔗 [Voting Frontend + Node Backend](https://github.com/sbrunomello/voting-contract)

---

## 📬 Contact

- [GitHub Profile](https://github.com/sbrunomello)  
Developed with ❤️ by Mello
