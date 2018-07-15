//
//  Question.swift
//  Quizzler
//
//  Created by Jason on 2018/7/13.
//  Copyright © 2018年 Jiaxin Li. All rights reserved.
//

import Foundation

class Question
{
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool)
    {
        questionText = text
        answer = correctAnswer
    }
    
    
}
