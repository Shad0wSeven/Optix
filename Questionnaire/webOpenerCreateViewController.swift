//
//  webOpenerCreateViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/14/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit
import SafariServices

class webOpenerCreateViewController: UIViewController {
    
    public var toPaste: String = "NULL TRY AGAIN!"

    @IBAction func copyAgain(_ sender: UIButton) {
        UIPasteboard.general.string = toPaste
    }
    
    @IBAction func openWebsite(_ sender: UIButton) {
        if let url = URL(string: "https://pastebin.com/") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    @IBAction func Continue(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "finalDoneView") as? finalCreateSetDoneViewController
            else {
            return
        }
        vc.title = "Done"

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
