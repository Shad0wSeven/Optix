//
//  ViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/8/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    let child = SpinnerViewController()

    // add the spinner view controller
    let data = DataLoader().problemData
    

    
    
    
    @IBAction func createOrLoadSet(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "chooserID") as? WhichOneViewController else {
            return
        }
        vc.title = "Create or Load Sets"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet var noConnection: UILabel!
    
    // Loading Table
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        noConnection.isHidden = true
        let created = createSpinnerView()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        if created == false {
            let alert = UIAlertController(title: "Update Check Failed", message: "Failed to check for new resources, Check your Internet Connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true)
            noConnection.isHidden = false
        }
        
    
    
    }
    func createSpinnerView() -> Bool{
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        // Loading Data
        let success = InternetDataLoader().load()
        
        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        return success
    }
    

    
    // Loading titles into the Cell
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Title
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data?.problems[indexPath.row].name
        cell.detailTextLabel?.text = data?.problems[indexPath.row].desc

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Recommended"


    }
    
    // Pressing Table
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Initialize variables to send
        guard let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController else {
            return
        }

        vc.title = data!.problems[indexPath.row].name
        vc.row = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

