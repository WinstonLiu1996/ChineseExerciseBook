//
//  SampleMultiples.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-22.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import Foundation


class Samples{
    //The title param gives "which grade information, this string is used when moving from question view to grade selected view. Use the information to decide display"
    let samples : [Multiple4Choice] = [
        Multiple4Choice(difficulty: .Winter, title: "grade 7", mainQuestion: "Where is UBC", A: "Vancouver", B: "Victoria", C: "Toronto", D: "Banff", correct: 0),
        
        Multiple4Choice(difficulty: .Winter, title: "grade 7", mainQuestion: "What is 1+1", A: "3", B: "4", C: "2", D: "0", correct: 2),
        
        Multiple4Choice(difficulty: .Fall, title: "grade 8", mainQuestion: "Which planet do we live on?", A:"Jupiter", B: "Earth", C: "Mars", D: "Mercury", correct: 1),
        
        Multiple4Choice(difficulty: .Fall, title: "grade 8", mainQuestion: "Who is the founder of TPTJ?", A:"Byron", B: "Tom", C: "Roceley", D: "Marlon", correct: 210),
        
        Multiple4Choice(difficulty: .Summer, title: "grade 9", mainQuestion: "Which course in UBC teaches Java programming language?", A: "CPSC 121", B: "CPSC 213", C: "CPSC 221", D: "CPSC 210", correct: 3),
        
        Multiple4Choice(difficulty: .Summer, title: "grade 9", mainQuestion: "Where is YVR located? ", A: "Vancouver", B: "San Francisco", C: "Los Angeles", D: "Las Vegas", correct: 0),
        
        Multiple4Choice(difficulty: .Summer, title: "grade 9", mainQuestion: "What does Oyasumi means in Japanese? ", A: "Good day", B: "Good night", C: "Good Morning", D: "Good afternoon", correct: 1)
    ]
}