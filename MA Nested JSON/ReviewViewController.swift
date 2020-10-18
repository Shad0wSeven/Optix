//
//  ReviewViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/27/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = DataLoader().problemData
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var SetTitleLabel: UILabel!
    
    @IBOutlet var NumberCorrectLabel: UILabel!
    
    public var answerMatrix: [Bool] = []
    
    public var currentSetNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        let counts = Dictionary(answerMatrix.map{ ($0, 1) }, uniquingKeysWith: +)
        
        SetTitleLabel.text = data?.problems[currentSetNumber].name
        NumberCorrectLabel.text = "\(counts[true] ?? 0)/\(data?.problems[currentSetNumber].set.count ?? 0) Correct"

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.problems[currentSetNumber].set.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Problem \(indexPath.row + 1)"
        cell.detailTextLabel?.text = "Correct Answer: \(answerMatrix[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "reviewProblem") as? ReviewProblemViewController else {
            return
        }

        vc.title = "Problem \(indexPath.row + 1)"
        vc.answerMatrix = answerMatrix
        vc.currentProblemNumber = indexPath.row
        vc.currentSetNumber = currentSetNumber
        
        navigationController?.pushViewController(vc, animated: true)
        
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
