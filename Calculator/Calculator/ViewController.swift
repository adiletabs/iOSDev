//
//  ViewController.swift
//  Calculator
//
//  Created by Adilet Absatov on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    private var calculatorModel = CalculatorModel()
    
    var displayValue: String {
        get {
            return display.text!
        }
        set {
            display.text = newValue
        }
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        calculatorModel.addDigit(sender.currentTitle!)
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func binaryOperationPressed(_ sender: UIButton) {
        calculatorModel.performBinaryOperation(sender.currentTitle!)
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        calculatorModel.performEquals()
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        calculatorModel.changeSign()
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func percentPressed(_ sender: UIButton) {
        calculatorModel.performPercent()
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        calculatorModel.performDot()
        displayValue = calculatorModel.getDisplayValue()
    }
    
    @IBAction func performClear(_ sender: UIButton) {
        calculatorModel.performClear()
        displayValue = calculatorModel.getDisplayValue()
    }
}

