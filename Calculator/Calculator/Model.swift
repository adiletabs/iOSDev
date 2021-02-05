//
//  Model.swift
//  Calculator
//
//  Created by Adilet Absatov on 05.02.2021.
//

import Foundation

enum State {
    case Accumulate
    case Accumulate2
    case Result
    case Error
}

enum Operation {
    case unaryOperation((Double)->String)
    case binaryOperation((Double, Double)->Double)
}

struct CalculatorModel {
    private var currentState: State = .Result
    private var displayValue: String = "0"
    private var firstOperand: Double?
    private var secondOperand: Double?
    private var lastOperation: String?
    
    var operations: Dictionary<String, Operation> =
    [
        "+": Operation.binaryOperation({$0+$1}),
        "–": Operation.binaryOperation({$0-$1}),
        "x": Operation.binaryOperation({$0*$1}),
        "÷": Operation.binaryOperation({$0/$1}),
        "+/-": Operation.unaryOperation({String(-1*$0)}),
    ]

    mutating func addDigit(_ digit: String) {
        switch currentState {
        case .Accumulate:
            displayValue += digit
        default:
            displayValue = digit
            currentState = .Accumulate
        }
    }
    
    mutating func performBinaryOperation(_ operation: String) {
        switch currentState {
        case .Accumulate:
            if let lastOp = lastOperation {
                displayValue = compute(lastOp, Double(displayValue)!)
            }
            currentState = .Accumulate2
        default:
            break
        }
        firstOperand = Double(displayValue)
        lastOperation = operation
    }
    
    mutating func performEquals() {
        switch currentState {
        case .Accumulate:
            if let lastOp = lastOperation {
                secondOperand = Double(displayValue)
                displayValue = compute(lastOp, secondOperand!)
            }
            currentState = .Result
            firstOperand = Double(displayValue)
        case .Accumulate2:
            secondOperand = Double(displayValue)
            if let lastOp = lastOperation {
                displayValue = compute(lastOp, secondOperand!)
            }
            currentState = .Result
        case .Result:
            if let lastOp = lastOperation {
                firstOperand = Double(displayValue)
                displayValue = compute(lastOp, secondOperand!)
            }
        default:
            break
        }
    }
    
    mutating func changeSign() {
        let currentValue: Double = Double(displayValue)!
        displayValue = String(-1 * currentValue)
    }
    
    mutating func performPercent() {
        switch currentState {
        case .Accumulate, .Result:
            let currentValue: Double = Double(displayValue)!
            if let lastOp = lastOperation {
                let newValue: Double = firstOperand! / 100 * Double(displayValue)!
                displayValue = String(newValue)
                displayValue = compute(lastOp, newValue)
            } else {
                displayValue = String(currentValue / 100)
            }
            currentState = .Result
        default:
            break
        }
    }
    
    mutating func performDot() {
        switch currentState {
        case .Accumulate:
            if !displayValue.contains(".") {
                displayValue += "."
            }
        default:
            displayValue = "0."
            currentState = .Accumulate
        }
    }
    
    mutating func performClear() {
        displayValue = "0"
        currentState = .Result
        clear()
    }
    
    mutating func getDisplayValue() -> String {
        if displayValue == "inf" {
            currentState = .Error
            displayValue = "Error"
            clear()
        }
        while displayValue.contains(".") && displayValue.last == "0" {
            displayValue = String(displayValue.dropLast())
            if displayValue.last == "." {
                displayValue = String(displayValue.dropLast())
                if displayValue == "" || displayValue == "-" {
                    displayValue = "0"
                }
            }
        }
        return displayValue
    }
    
    // HELPER FUNCTIONS
    func compute(_ lastOperation: String, _ operand: Double) -> String {
        switch operations[lastOperation] {
        case .binaryOperation(let function):
            return String(function(firstOperand!, operand))
        default:
            return displayValue
        }
    }
    
    mutating func clear() {
        firstOperand = nil
        secondOperand = nil
        lastOperation = nil
    }
}
