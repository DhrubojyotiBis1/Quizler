//
//  Quesion.swift
//  Quizzler
//
//  Created by Dhrubojyoti on 27/12/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let question : String
    let answere : Bool
    
    init(text qsn : String , correctAnswer ans :Bool){
        question = qsn
        answere = ans
    }
}
