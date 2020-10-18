//
//  NextStep1ViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/13/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class NextStep1ViewController: UIViewController {
    
    // Now to convert to JSON
    
    @IBAction func LetsGoButton(_ sender: UIButton) {
        
        let meta: String = """
        "meta": {
            "name": "PasteBin Problem Set",
            "author": "\(author)",
            "version": "1.0a"
        },
        """

        
        var setString: String = """
        "id": 99999,
        "name": "\(titleText)",
        "difficulty": \(diff),
        "author": "\(author)",
        "desc": "\(desc)",
        "time": \(time),
        "set": [
        """
        
        for question in questionMatrix {
            let questionSet = """
            {
                "question": "\(question.question)",
                "answer_method": "\(question.answerMethod)",
                "answer": \(question.answer),
                "solution": "\(question.solution)"
            }
            """
            setString = setString + questionSet + ","
        }
        
        setString.removeLast()
        
        setString = setString + "]"
        
        let finalString = """
        {
        \(meta)
        "problems": [{
        \(setString)
        }]
        }
        """
        
//        print(finalString)
        
            guard let vc = storyboard?.instantiateViewController(identifier: "copyShare") as? CopyShareViewController
                else {
                return
            }
            vc.title = "Copy"
            vc.toPaste = finalString

            navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    public var titleText: String = "No Value Provided"
    public var desc: String = "No Value Provided"
    public var author: String = "No Value Provided"
    public var time: Int = 0
    public var diff: Int = 0
    public var questionMatrix: [Question] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        print(questionMatrix)
    }
    
    
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
