//
//  Question.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-22.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import Foundation


class Question{
    let difficulty : Difficulty //Default difficulty is winter (Easiest)
    let title : String? //Question type or other necessary information goes here
    let mainQuestion : String
    
    init(difficulty : Difficulty, title : String, mainQuestion :String){
        self.difficulty = difficulty
        self.title = title
        self.mainQuestion = mainQuestion
    }
    
    enum Difficulty : String{
        case Spring = "spring"
        case Summer = "summer"
        case Fall = "fall"
        case Winter = "winter"
        
        init(){
            self = Difficulty.Winter
        }
    }
}


class Multiple4Choice : Question{
    //Answers, as strings, are put in an array, 0 1 2 3 represents A B C D
    
    let answers : [String]
    let correct : Int
    
    init(difficulty: Difficulty, title: String, mainQuestion : String, A : String, B: String, C : String, D : String, correct : Int){
        self.answers = [A,B,C,D]
        self.correct = correct
        super.init(difficulty : difficulty, title: title, mainQuestion: mainQuestion)
    }
    func getAnswerOf(choice0to3 choice0to3 : Int) -> String{
        return answers[choice0to3];
    }
}

class Multiple3Choice : Question{
    
}

class Multiple5Choice : Question{
    
}

