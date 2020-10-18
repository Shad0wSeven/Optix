//
//  Problem.swift
//  MA Nested JSON
//
//  Created by Ayush Nayak on 8/8/20.
//  Copyright © 2020 Ayush Nayak. All rights reserved.
//

import Foundation

struct Problem : Codable {
    struct Meta : Codable {
        let name: String
        let author: String
        let version: String
    }
    struct Problems : Codable {
        let id: Int
        let name: String
        let difficulty: Int
        let author: String
        let desc: String
        let time: Int
        struct Set : Codable {
            let question: String
            let answer_method: String
            let answer: Int
            let solution: String
        }
        let set: [Set]
    }

    let meta: Meta
    var problems: [Problems]
}
