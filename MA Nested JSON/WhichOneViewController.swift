//
//  WhichOneViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/13/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class WhichOneViewController: UIViewController {

    @IBAction func CancelButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "homeView") as? ViewController else {
            return
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func createASet(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "createBegin") as? CreateBeginViewController
            else {
            return
        }
        vc.title = "Create a Set"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loadASet(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "loadSet") as? loadASetViewController
            else {
            return
        }
        vc.title = "Load a Set"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
