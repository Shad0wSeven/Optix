//
//  DetailViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/8/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public var row: Int = 0
    
    let data = DataLoader().problemData
    
    @IBOutlet var table: UITableView!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        // Now load the View Controller
        let toSend = [Bool]()
        
        guard let vc = storyboard?.instantiateViewController(identifier: "problem") as? ProblemViewController else {
            return
        }

        vc.currentAnswerMatrix = toSend
        vc.currentProblemNumber = 0
        vc.currentSetNumber = row
        vc.timeLeft = (data?.problems[row].time ?? 0) * 60
        vc.title = "Problem 1 of \(data?.problems[row].set.count ?? 0)"

        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

    

        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return basicInfArray.count
        case 1:
            return sampleArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Basic Info"
        case 1:
            return "Sample Problem"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Title
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = basicInfArray[indexPath.row]
            cell.detailTextLabel?.text = basicInfo[indexPath.row]
        case 1:
            cell.textLabel?.text = sampleArray[indexPath.row]
            cell.detailTextLabel?.text = sampleProblem[indexPath.row]
        default:
            cell.textLabel?.text = "This should never happen!" // Shouldnt Happen
        }
        cell.textLabel!.numberOfLines = 0
        cell.detailTextLabel!.numberOfLines = 0
        return cell
    }
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // Following contains a force unwrap, fix!!!!!!!
    let basicInfArray = ["Description:", "Difficulty:", "Set Author:", "Total Time:"]
    
    lazy var basicInfo = [data?.problems[row].desc, "\(data!.problems[row].difficulty)", data?.problems[row].author, "\(data!.problems[row].time)"]
    
    let sampleArray = ["Question:", "Answer With:", "Answer:"]
    
    lazy var sampleProblem = [data?.problems[row].set[0].question, data?.problems[row].set[0].answer_method, "\(data!.problems[row].set[0].answer)"]
    

}
