//
//  ViewController.swift
//  Calculator
//
//  Created by user188731 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var current = "0"
    var operation = ""
    var delResultText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculate(x: Double, y: Double, operation: String) -> Double {
        switch operation {
        case "+":
            return x + y
        case "-":
            return x - y
        case "×":
            return x * y
        case "÷":
            return x / y
        default:
            return y
        }
    }

    @IBAction func processNumber(_ sender: UIButton) {
            if let numberText = sender.titleLabel?.text {
                if !delResultText {
                    if (resultLabel.text == "0") {
                        resultLabel.text = numberText
                    } else {
                        resultLabel.text = resultLabel.text! + numberText
                    }
                } else {
                    resultLabel.text = numberText
                    delResultText = false
                }
                
            }
        }
    
    @IBAction func processEquals(_ sender: UIButton) {
        let x = Double(current)
        let y = Double(resultLabel.text!)
        let result = calculate(x: x!, y: y!, operation: operation)
        resultLabel.text = String(result)
        current = "0"
        delResultText = true
        operation = ""
    }
    
    
    @IBAction func processClear(_ sender: UIButton) {
        resultLabel.text = "0"
        current = "0"
        delResultText = true
        operation = ""
    }
    
    @IBAction func processOperation(_ sender: UIButton) {
        if let operationText = sender.titleLabel?.text {
            if operation.isEmpty {
                operation = operationText
                current = resultLabel.text ?? "0"
                delResultText = true
                
            } else {
                let x = Double(current)
                let y = Double(resultLabel.text!)
                let result = calculate(x: x!, y: y!, operation: operation)
                current = String(result)
                resultLabel.text = String(result)
                operation = operationText
                delResultText = true
            }
        }
    }
    
    
}

