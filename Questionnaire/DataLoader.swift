//
//  DataLoader.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/8/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import Foundation



public class DataLoader {
    let defaults = UserDefaults.standard // Load UserDefaults
    var problemData: Problem?
    init() {
        load()
    }
    
    func load() {
        
          if let fileLocation = URL(string: "https://raw.githubusercontent.com/Shadow5472/MAS/master/data.json" ) {

              do {
                  // Get Data from Online and Convert to JSON Object
                  let data = try Data(contentsOf: fileLocation)
                  let jsonDecoder = JSONDecoder()
                  let dataFromJson = try jsonDecoder.decode(Problem.self, from: data)
                  self.problemData = dataFromJson
              } catch {
                  print(error)
                
                if let fileLocation = Bundle.main.url(forResource: "package", withExtension: "json") {
                    
                    do {
                        let data = try Data(contentsOf: fileLocation)
                        let jsonDecoder = JSONDecoder()
                        let dataFromJson = try jsonDecoder.decode(Problem.self, from: data)
                        self.problemData = dataFromJson
                    } catch {
                        print(error)
                    }
                }
            }
            
            // Code to load the rest
            // If the interent is working, the rest of the datasets will be loaded, and the dataFromJson.Question will be appended to problemDat
//            problemData?.problems.append(<#T##newElement: Problem.Problems##Problem.Problems#>)
            
            // Get Data
            let array = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
            
            for item in array {
                if let fileLocation = URL(string: item ) {
                    do {
                      // Get Data from Online and Convert to JSON Object
                      let data = try Data(contentsOf: fileLocation)
                      let jsonDecoder = JSONDecoder()
                      let dataFromJson = try jsonDecoder.decode(Problem.self, from: data)
                        problemData?.problems.append(dataFromJson.problems[0])
                    } catch {
                      print(error)
                        print("Not Sent!")
                    }
                }
            }
        }
    }
}


//        if let fileLocation = URL(string: "https://raw.githubusercontent.com/Shadow5472/MAS/master/data.json" ) {
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let jsonDecoder = JSONDecoder()
//                let dataFromJson = try jsonDecoder.decode(Problem.self, from: data)
//
//                self.problemData = dataFromJson
//            } catch {
//                print(error)
//            }
//        }
    


