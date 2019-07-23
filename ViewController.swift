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
    let buttonColor = UIColor(hue: 0.325, saturation: 0.14, brightness: 0.97, alpha: 1.0)
    
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
    
    func generateNewProblem () {
        problemOperation = Int.random(in: 0...3)
        
        if problemOperation == 0 {
            //addition problem
            numberOne = Int.random(in: 5...50)
            numberTwo = Int.random(in: 5...50)
            correctAnswer = numberOne + numberTwo
        } else if problemOperation == 1 {
            //subtraction problem
            numberOne = Int.random(in: 50...100)
            numberTwo = Int.random(in: 5...40)
            correctAnswer = numberOne - numberTwo
        } else if problemOperation == 2 {
            //multiplication problem
            numberOne = Int.random(in: 2...10)
            numberTwo = Int.random(in: 2...10)
            correctAnswer = numberOne * numberTwo
        } else if problemOperation == 3 {
            //division problem
            numberTwo = Int.random(in: 3...10)
            numberOne = Int.random(in: 3...10) * numberTwo
            correctAnswer = numberOne/numberTwo
        }
        generatingAnswerOptions()
    }
    
    func generatingAnswerOptions() {
        var i = 0
        while i < 3 {
            var n = 0
            while n == 0 {
                n = Int.random(in: -10...10)
                options[i] = correctAnswer + n
            }
            i += 1
        }
        options[3] = correctAnswer
        options.shuffle()
    }
    
    
    func updateLabels () {
        numberOneLabel.text = String(numberOne)
        numberTwoLabel.text = String(numberTwo)
        operationLabel.text = operations[problemOperation]
        
        updateOptions(option: optionOneButton, num: 1)
        updateOptions(option: optionTwoButton, num: 2)
        updateOptions(option: optionThreeButton, num: 3)
        updateOptions(option: optionFourButton, num: 4)
        
        problemCorrectLabel.text = String(problemCorrect)
        problemTotalLabel.text = String(problemTotal)
        currentProblemLabel.text = String(problemNumber)
        
        enableButtons()
    }
    
    func updateOptions (option: UIButton, num: Int) {
        option.setTitle(String(options[num-1]), for: .normal)
        option.setBackgroundColor(color: buttonColor, forState: .normal)
    }
    
    func newGame () {
        problemTotal = 0
        problemCorrect = 0
        problemNumber = 1
        generateNewProblem()
        updateLabels()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        nextProblem()
    }
    
    func nextProblem () {
        problemNumber += 1
        generateNewProblem()
        updateLabels()
    }
    
    @IBAction func startOverButton(_ sender: Any) {
        newGame()
    }

    @IBAction func optionOneTouched(_ sender: Any) {
        buttonTouched(option: optionOneButton)
    }
    
    @IBAction func optionTwoTouched(_ sender: Any) {
        buttonTouched(option: optionTwoButton)
    }
    
    @IBAction func optionThreeTouched(_ sender: Any) {
        buttonTouched(option: optionThreeButton)
    }
    
    @IBAction func optionFourTouched(_ sender: Any) {
        buttonTouched(option: optionFourButton)
    }
    
    //checks if the option is the correct answer and responds accordingly
    func buttonTouched (option: UIButton) {
        if option.currentTitle == String(correctAnswer) {
            answerCorrect(option: option)
        } else {
            answerIncorrect(option: option)
        }
    }
    
    func answerCorrect (option: UIButton) {
        problemCorrect += 1
        problemTotal += 1
        option.setBackgroundColor(color: UIColor.green, forState: .normal)
        disableButtons()
    }
    
    func answerIncorrect (option: UIButton) {
        problemTotal += 1
        option.setBackgroundColor(color: UIColor.red, forState: .normal)
        disableButtons()
    }
    
    func disableButtons () {
        optionOneButton.isEnabled = false
        optionTwoButton.isEnabled = false
        optionThreeButton.isEnabled = false
        optionFourButton.isEnabled = false
    }
    
    func enableButtons () {
        optionOneButton.isEnabled = true
        optionTwoButton.isEnabled = true
        optionThreeButton.isEnabled = true
        optionFourButton.isEnabled = true
    }
    
}

