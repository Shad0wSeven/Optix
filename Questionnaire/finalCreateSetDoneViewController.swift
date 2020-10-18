//
//  finalCreateSetDoneViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/14/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class finalCreateSetDoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "homeView") as? ViewController else {
            return
        }

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
