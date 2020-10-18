//
//  CreateBeginViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/13/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class CreateBeginViewController: UIViewController {

    @IBOutlet weak var descriptionText: UITextField! // ACTUALLY THE TITLE MB!
    
    @IBOutlet weak var descText: UITextField!
    
    @IBOutlet weak var authorText: UITextField!
    
    @IBOutlet weak var timeText: UITextField!
    
    @IBOutlet weak var diffText: UITextField!
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        // Gathering Data
        
        let title: String = descriptionText.text ?? "NULL"
        
        var desc: String = descText.text ?? "No Description Provided"
        
        var author: String = authorText.text ?? "No Author Provided"
        
        let time: String = timeText.text ?? "0"
        
        let difficulty: String = diffText.text ?? "0"
        
//        print(title)
        
        // Checking Title
        if title == "NULL" || title == "" {
            print("Null Title!")
            let alert = UIAlertController(title: "No Title!", message: "Please Provide a Title!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        // Now Setting Defaults
        if desc == "" {
            desc = "No Description Provided :("
        }
//        print(desc)
        
        if author == "" {
            author = "The Author Remains a Mystery. . ."
        }
//        print(author)
        
        // Now for the Ints

        var timeInt: Int =  Int(time) ?? -2147483647 // Min N!
        
        if timeInt == -2147483647 && time != "" {
            print("Number Error!")
            let alert = UIAlertController(title: "Invalid Number for Time!", message: "Please just enter numbers, or leave this field blank!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        if timeInt == -2147483647 {
            timeInt = 0
        }
        
        var diffInt: Int =  Int(difficulty) ?? -2147483647 // Min N!
        
        if diffInt == -2147483647 && time != "" {
            print("Number Error!")
            let alert = UIAlertController(title: "Invalid Number for Difficulty!", message: "Please just enter numbers, or leave this field blank!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        if diffInt == -2147483647 {
            diffInt = 0
        }
        
        // Present New View Controller
        guard let vc = storyboard?.instantiateViewController(identifier: "createQuestion") as? CreateQuestionViewController
            else {
            return
        }
        vc.title = "Create a Set"
        vc.titleText = title
        vc.author = author
        vc.desc = desc
        vc.diff = diffInt
        vc.time = timeInt
        vc.num = 1
        navigationController?.pushViewController(vc, animated: true)

        
//        print("Ran!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        
        // View Stuff
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    // Data Set
    /*
     str name
     int difficulty
     str author
     str desc
     int time
     arr [
        {
            str question
            str answer method
            int answer
            str solution
        },
     ]
     */
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


