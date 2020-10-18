//
//  CopyShareViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/14/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class CopyShareViewController: UIViewController {

    public var toPaste: String = "NULL TRY AGAIN!"
    
    @IBAction func buttonCopy(_ sender: UIButton) {
        UIPasteboard.general.string = toPaste
        
        // Present Next
        guard let vc = storyboard?.instantiateViewController(identifier: "webLoader") as? webOpenerCreateViewController
            else {
            return
        }
        vc.title = "Open Website"
        vc.toPaste = toPaste

        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
