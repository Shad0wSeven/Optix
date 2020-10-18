//
//  ReviewProblemViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/27/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class ReviewProblemViewController: UIViewController {
    
    let data = DataLoader().problemData

    @IBOutlet var ProblemName: UILabel!
    
    @IBOutlet var CorrectIncorrect: UILabel!
    
    @IBOutlet var CorrectAnswer: UILabel!
    
    @IBOutlet var SolutionText: UILabel!
    
    public var answerMatrix: [Bool] = []
    
    public var currentSetNumber: Int = 0
    
    public var currentProblemNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProblemName.text? = data?.problems[currentSetNumber].set[currentProblemNumber].question ?? "<NOT FOUND!>"
        
        CorrectAnswer.text? = "\(data?.problems[currentSetNumber].set[currentProblemNumber].answer ?? 0)"
        
        var correctText: String = ""
        
        if answerMatrix[currentProblemNumber] {
            correctText = "Correct!"
        } else {
            correctText = "Incorrect!"
        }
        
        CorrectIncorrect.text? = correctText
        
        SolutionText.text? = data?.problems[currentSetNumber].set[currentProblemNumber].solution ?? "No Solution Provided!"
        
        

        // Do any additional setup after loading the view.
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
