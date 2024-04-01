// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Question {
        string questionText;
        string option1;
        string option2;
        uint256 votesOption1;
        uint256 votesOption2;
    }

    mapping(uint256 => Question) public questions;
    uint256 public questionCount;

    constructor() {
        questionCount = 0;
    }

    function createQuestion(string memory _questionText, string memory _option1, string memory _option2) external {
        questionCount++;
        questions[questionCount] = Question({
            questionText: _questionText,
            option1: _option1,
            option2: _option2,
            votesOption1: 0,
            votesOption2: 0
        });
    }

    function vote(uint256 _questionId, uint256 _option) external {
        require(_option == 1 || _option == 2, "Invalid option");
        require(_questionId > 0 && _questionId <= questionCount, "Invalid question ID");

        if (_option == 1) {
            questions[_questionId].votesOption1++;
        } else {
            questions[_questionId].votesOption2++;
        }
    }

    function getVotes(uint256 _questionId, uint256 _option) external view returns (uint256) {
        require(_option == 1 || _option == 2, "Invalid option");
        require(_questionId > 0 && _questionId <= questionCount, "Invalid question ID");

        if (_option == 1) {
            return questions[_questionId].votesOption1;
        } else {
            return questions[_questionId].votesOption2;
        }
    }

    function getQuestion(uint256 _questionId) external view returns (string memory, string memory, string memory) {
        require(_questionId > 0 && _questionId <= questionCount, "Invalid question ID");

        Question memory question = questions[_questionId];
        return (question.questionText, question.option1, question.option2);
    }
}
