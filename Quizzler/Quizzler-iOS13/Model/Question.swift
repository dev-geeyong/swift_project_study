//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by dev.geeyong on 2020/12/31.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let quiz : String
    let choice : [String]
    let result: String
    
    init(q: String , a: [String] ,correctAnswer: String) {
            quiz = q
        choice = a
            result = correctAnswer
    }
}

