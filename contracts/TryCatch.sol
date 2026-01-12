// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Calculator {
    function divide(uint256 a, uint256 b) external pure returns (uint256) {
        require(b != 0, "Division by zero");
        return a / b;
    }
}

contract TryCatchExample {
    Calculator public calculator;

    constructor() {
        calculator = new Calculator();
    }

    function safeDivide(
        uint256 a,
        uint256 b
    ) public view returns (string memory, uint256) {
        try calculator.divide(a, b) returns (uint256 result) {
            return ("Success", result);
        } catch Error(string memory reason) {
            return (reason, 0);
        } catch {
            return ("Unknown error", 0);
        }
    }
}
