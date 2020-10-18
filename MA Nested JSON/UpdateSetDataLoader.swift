//
//  UpdateSetDataLoader.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 9/12/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import Foundation



public class InternetDataLoader {
    
    let data = DataLoader().problemData
    var problemData: Problem?
    var succeeded: Bool?
    
    init() {}
    
    func load() -> Bool {
        
        if let fileLocation = URL(string: "https://raw.githubusercontent.com/Shadow5472/MAS/master/data.json" ) {

            do {
                // Get Data from Online and Convert to JSON Object
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(Problem.self, from: data)
                self.problemData = dataFromJson
                self.succeeded = true
            } catch {
                print(error)
                self.succeeded = false
            }
            
            //MARK: Downloading Data
            
            if problemData?.meta.version != data?.meta.version && self.succeeded == true {
  
                }

            } else if self.succeeded == false {
                print("Errno[1] No Internet Connection Found, or Failure in Recieving Data!")
                // No Internet/Failed

            }
        return succeeded ?? false
            
        }
        
        
    }

