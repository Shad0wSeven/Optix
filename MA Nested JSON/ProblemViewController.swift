//
//  ProblemViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/9/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController {
    
    lazy var noneLeft: Int = timeLeft
    var timer = Timer()
    
    // Load Data
    
    let data = DataLoader().problemData

    // Connections
    @IBOutlet weak var timeRemainingText: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var problemLabel: UILabel!
    
    @IBOutlet var pleaseEnterAnswerText: UILabel!
    
    @IBOutlet var invalidAnswerText: UILabel!
    
    @IBAction func probFinishedButton(_ sender: Any) {
        let newProblemNumber: Int = currentProblemNumber + 1
        
        var answerMatrix: [Bool] = currentAnswerMatrix
        
        if let answer = textField.text, !answer.isEmpty {
           // myTextField is not empty here
            let answerInt = Int(answer) ?? 999999999
            
            if answerInt == 999999999 {
                
                // Invalid answer
                pleaseEnterAnswerText.isHidden = true
                
                invalidAnswerText.isHidden = false
                
            } else {
                // Not an invalid answer
                if "\(data?.problems[currentSetNumber].set[currentProblemNumber].answer ?? 0)" == answer {
                       answerMatrix.append(true)
//                       print("\(String(describing: answer)): TRUE")
                   } else {
                       answerMatrix.append(false)
//                       print("\(String(describing: answer)): FALSE")

                   }
                   
                   // Send Next View Controller
                
                   timer.invalidate()
                    
                   // Send Next Problem
                   
                   if newProblemNumber == data!.problems[currentSetNumber].set.count {
                       // Final Answer
                    
                    
                        guard let vc = storyboard?.instantiateViewController(identifier: "finalView") as? FinalViewController else {
                            return
                        }
                        
                        vc.answerMatrix = answerMatrix
                        vc.currentSetNumber = currentSetNumber
                        vc.title = "Summary"

                        navigationController?.pushViewController(vc, animated: true)

                    
                   } else {

                           guard let vc = storyboard?.instantiateViewController(identifier: "problem") as? ProblemViewController else {
                               return
                           }
                           
                           // With Updated Variables!
                          
                           vc.currentAnswerMatrix = answerMatrix
                           vc.currentProblemNumber = newProblemNumber
                           vc.currentSetNumber = currentSetNumber
                           vc.timeLeft = noneLeft
                           vc.title = "Problem \(newProblemNumber + 1) of \(data?.problems[currentSetNumber].set.count ?? 0)"

                           navigationController?.pushViewController(vc, animated: true)
                   }
            }
            
        } else {
           // myTextField is Empty
            invalidAnswerText.isHidden = true
            pleaseEnterAnswerText.isHidden = false
           
        }

    }
    
    // Public Variables
    
    public var currentAnswerMatrix: [Bool] = []
    
    public var currentProblemNumber: Int = 0
    
    public var currentSetNumber: Int = 0
    
    public var timeLeft: Int = 0 // Edit Later
    
    // Setting the Text Labels
    @objc func timerAction(){
        self.noneLeft -= 1
//        print(self.noneLeft)
        timeRemainingText.text = "\(noneLeft / 60):\(noneLeft % 60)"
        
        // if timer is 0
        
        if noneLeft == 0 {
            // Fill the array with the rest of the values
            while currentAnswerMatrix.count != data?.problems[currentSetNumber].set.count ?? 0 {
                currentAnswerMatrix.append(false)
            }
            // Present the Final View Controller
            guard let vc = storyboard?.instantiateViewController(identifier: "finalView") as? FinalViewController else {
                return
            }
            
            vc.answerMatrix = currentAnswerMatrix
            vc.currentSetNumber = currentSetNumber
            vc.title = "Summary"

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingText.text = "\(noneLeft / 60):\(noneLeft % 60)"

        // Do any additional setup after loading the view.
        
        problemLabel.text = data?.problems[currentSetNumber].set[currentProblemNumber].question
        textField.placeholder = data?.problems[currentSetNumber].set[currentProblemNumber].answer_method
        self.navigationItem.setHidesBackButton(true, animated: true);
        pleaseEnterAnswerText.isHidden = true
        invalidAnswerText.isHidden = true
        
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            // Decrement seconds, and update
//            self.noneLeft -= 1
//            print(self.noneLeft)
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

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
