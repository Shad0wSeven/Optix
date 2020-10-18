//
//  FinalViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/9/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    // Load Data
    
    let data = DataLoader().problemData
    
    // Connections
    
    @IBAction func reviewAnswerButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "reviewView") as? ReviewViewController else {
            return
        }
        
        vc.answerMatrix = answerMatrix
        vc.currentSetNumber = currentSetNumber
        vc.title = "Review Answers"

        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet var numberCorrect: UILabel!
    
    @IBOutlet var percentCorrect: UILabel!
    
    @IBOutlet var setTitle: UILabel!
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "homeView") as? ViewController else {
            return
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    


    // Public Variables
    
    public var answerMatrix: [Bool] = []
    
    public var currentSetNumber: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Gather correct number
        let counts = Dictionary(answerMatrix.map{ ($0, 1) }, uniquingKeysWith: +)
        
        setTitle.text = data?.problems[currentSetNumber].name
        self.navigationItem.setHidesBackButton(true, animated: true);
        numberCorrect.text = "\(counts[true] ?? 0)/\(data?.problems[currentSetNumber].set.count ?? 0) Correct"
        let correctFloat = Float(counts[true] ?? 0) / Float(data?.problems[currentSetNumber].set.count ?? 0)
        percentCorrect.text = "\(correctFloat * 100.0)%"
        
//        self.navigationController?.isNavigationBarHidden = true
        
        
    }
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
