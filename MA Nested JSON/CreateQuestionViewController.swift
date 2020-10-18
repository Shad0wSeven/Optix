//
//  CreateQuestionViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/13/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var QuestionText: UITextField!
    
    @IBOutlet weak var AnswerText: UITextField!
    
    @IBOutlet weak var SolutionText: UITextField!
    
    lazy var questionMaze: [Question] = questionMatrix
    
    @IBAction func AddAnother(_ sender: UIButton) {
        let questionText: String = QuestionText.text ?? "NULL"
        let answerText: String = AnswerText.text ?? "NULL"
        var solutionText: String = SolutionText.text ?? "NULL"
        
        // Check if Filled Out
        if questionText == "" || answerText == "" {
            print("Text Error!")
            let alert = UIAlertController(title: "Incomplete!", message: "Both Question and Answer MUST be filled out!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        // Check Answer
        var answerInt: Int =  Int(answerText) ?? -2147483647 // Min N, if this is used, oh well bug found!
        
        if answerInt == -2147483647 && answerText != "" {
            print("Number Error!")
            let alert = UIAlertController(title: "Invalid Number for Answer!", message: "Please just enter numbers!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        if answerInt == -2147483647 {
            answerInt = 0
        }
        
        // Check Solution
        if solutionText == "" {
            solutionText = "No Solution Provided!"
        }
        
        let toAdd: Question = Question(question: questionText, answer: answerInt, answerMethod: "Integer", solution: solutionText)
        
        questionMatrix.append(toAdd)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "createQuestion") as? CreateQuestionViewController
            else {
            return
        }
        vc.title = "Create a Set"
        
        vc.author = author
        vc.desc = desc
        vc.diff = diff
        vc.time = time
        vc.num = num + 1
        vc.titleText = titleText
        vc.questionMatrix = questionMatrix
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func FinishButton(_ sender: UIButton) {
        let questionText: String = QuestionText.text ?? "NULL"
        let answerText: String = AnswerText.text ?? "NULL"
        var solutionText: String = SolutionText.text ?? "NULL"
        
        // Check if Filled Out
        if questionText == "" || answerText == "" {
            print("Text Error!")
            let alert = UIAlertController(title: "Incomplete!", message: "Both Question and Answer MUST be filled out!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        // Check Answer
        var answerInt: Int =  Int(answerText) ?? -2147483647 // Min N, if this is used, oh well bug found!
        
        if answerInt == -2147483647 && answerText != "" {
            print("Number Error!")
            let alert = UIAlertController(title: "Invalid Number for Answer!", message: "Please just enter numbers!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        if answerInt == -2147483647 {
            answerInt = 0
        }
        
        // Check Solution
        if solutionText == "" {
            solutionText = "No Solution Provided!"
        }
        
        let toAdd: Question = Question(question: questionText, answer: answerInt, answerMethod: "Integer", solution: solutionText)
        
        questionMatrix.append(toAdd)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "next1") as? NextStep1ViewController
            else {
            return
        }
        vc.title = "Create a Set"
        
        vc.author = author
        vc.desc = desc
        vc.diff = diff
        vc.time = time
        vc.questionMatrix = questionMatrix
        vc.titleText = titleText
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Public Variables
    
    public var titleText: String = "No Value Provided"
    public var desc: String = "No Value Provided"
    public var author: String = "No Value Provided"
    public var time: Int = 0
    public var diff: Int = 0
    public var questionMatrix: [Question] = []
    public var num: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = "Question \(num)"
//        self.navigationController?.isNavigationBarHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
