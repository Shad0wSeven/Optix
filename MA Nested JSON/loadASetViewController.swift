//
//  loadASetViewController.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 10/14/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import UIKit

class loadASetViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var URLField: UITextField!
    @IBAction func goWIth(_ sender: UIButton) {
        let currentString: String = URLField.text ?? "NULL"
        if currentString == "" {
            print("No Value")
            let alert = UIAlertController(title: "Enter a URL!", message: "No URL provided, paste in your Pastebin URL!!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        let correctString: String = "https://pastebin.com/raw/XhSNcZeC"
        
        if currentString.count != correctString.count {
            print("Invalid Length")
            let alert = UIAlertController(title: "Invalid URL!", message: "Bad URL provided, paste in your Pastebin URL!! (Raw, so like this \"https://pastebin.com/raw/XhSNcZeC\")", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        let correctSub = "https://pastebin.com/raw"
        let givenIndex = currentString.firstIndex(of: "w")!
        let subString = currentString[...givenIndex]
        
        
        if correctSub != subString {
            print("Invalid URL")
            let alert = UIAlertController(title: "Invalid URL!", message: "Bad URL provided, paste in your Pastebin URL!! (Raw, so like this \"https://pastebin.com/raw/XhSNcZeC\")", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            return
        }
        
        // Like this https://pastebin.com/raw/XhSNcZeC
        
        // Now can write to userDefaults
        
        
        var array = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        array.append(currentString)
        print(array)
        defaults.set(array, forKey: "SavedArray")
        
        guard let vc = storyboard?.instantiateViewController(identifier: "chooserID") as? WhichOneViewController else {
            return
        }
        vc.title = "Create or Load Sets"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ClearSets(_ sender: UIButton) {
        defaults.removeObject(forKey: "SavedArray") // Dangerous lol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
