//
//  ViewController.swift
//  Math Practice
//
//  Created by Allen Su on 2019/7/22.
//  Copyright © 2019 Allen Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var problemNumber: Int = 0
    var numberOne: Int = 0
    var numberTwo: Int = 0
    var problemCorrect: Int = 0
    var problemTotal: Int = 0
    var options = [0, 0, 0, 0]
    var correctAnswer = 0
    var problemOperation = 0
    
    let operations = ["+", "-", "*", "/"]
    
    @IBOutlet weak var numberOneLabel: UILabel!
    @IBOutlet weak var numberTwoLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionFourButton: UIButton!
    
    @IBOutlet weak var currentProblemLabel: UILabel!
    @IBOutlet weak var problemCorrectLabel: UILabel!
    @IBOutlet weak var problemTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }
    
    
    @IBAction func startOverButton(_ sender: Any) {
        newGame()
    }
    func newGame () {
        problemTotal = 0
        problemCorrect = 0
        problemNumber = 1
        generateNewProblem()
        updateLabels()
    }

    func generateNewProblem () {
        problemOperation = Int.random(in: 0...3)

        if problemOperation == 0 {
            //addition problem
            numberOne = Int.random(in: 5...50)
            numberTwo = Int.random(in: 5...50)
            correctAnswer = numberOne + numberTwo
            options[0] = correctAnswer - 1
            options[1] = correctAnswer + 1
            options[2] = correctAnswer - 10
            options[3] = correctAnswer
            
        } else if problemOperation == 1 {
            //subtraction problem
            numberOne = Int.random(in: 50...100)
            numberTwo = Int.random(in: 5...40)
            correctAnswer = numberOne - numberTwo
            options[0] = correctAnswer - 1
            options[1] = correctAnswer + 1
            options[2] = correctAnswer - 10
            options[3] = correctAnswer
        } else if problemOperation == 2 {
            //multiplication problem
            numberOne = Int.random(in: 2...10)
            numberTwo = Int.random(in: 2...10)
            correctAnswer = numberOne * numberTwo
            options[0] = correctAnswer - 1
            options[1] = correctAnswer + 1
            options[2] = correctAnswer - 10
            options[3] = correctAnswer
        } else if problemOperation == 3 {
            //division problem
            numberTwo = Int.random(in: 3...10)
            numberOne = Int.random(in: 3...10) * numberTwo
            correctAnswer = numberOne/numberTwo
            options[0] = correctAnswer - 1
            options[1] = correctAnswer + 1
            options[2] = correctAnswer - 2
            options[3] = correctAnswer
        }
        options.shuffle()
        
        
    }
    
    
    func updateLabels () {
        numberOneLabel.text = String(numberOne)
        numberTwoLabel.text = String(numberTwo)
        operationLabel.text = operations[problemOperation]
        optionOneButton.setTitle(String(options[0]), for: .normal)
        optionTwoButton.setTitle(String(options[1]), for: .normal)
        optionThreeButton.setTitle(String(options[2]), for: .normal)
        optionFourButton.setTitle(String(options[3]), for: .normal)
        problemCorrectLabel.text = String(problemCorrect)
        problemTotalLabel.text = String(problemTotal)
        currentProblemLabel.text = String(problemNumber)
    }
    
    @IBAction func optionOneTouched(_ sender: Any) {
        if optionOneButton.currentTitle == String(correctAnswer) {
            answerCorrect()
        } else {
            answerIncorrect()
        }
    }
    
    @IBAction func optionTwoTouched(_ sender: Any) {
        if optionTwoButton.currentTitle == String(correctAnswer) {
            answerCorrect()
        } else {
            answerIncorrect()
        }
    }
    
    @IBAction func optionThreeTouched(_ sender: Any) {
        if optionThreeButton.currentTitle == String(correctAnswer) {
            answerCorrect()
        } else {
            answerIncorrect()
        }
    }
    
    @IBAction func optionFourTouched(_ sender: Any) {
        if optionFourButton.currentTitle == String(correctAnswer) {
            answerCorrect()
        } else {
            answerIncorrect()
        }
    }
    
    func answerCorrect () {
        problemCorrect += 1
        problemTotal += 1
        nextProblem()
        
    }
    
    func answerIncorrect () {
        problemTotal += 1
        nextProblem()
    }
    
    func nextProblem () {
        problemNumber += 1
        generateNewProblem()
        updateLabels()
    }
}

