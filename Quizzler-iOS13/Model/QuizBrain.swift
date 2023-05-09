//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Жансая Шакуали on 15.01.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    
    var array = [ Question(q: "Which is the largest organ in the human body?", a: "Skin", v: ["Heart", "Skin", "Large Intestine"]),
                  Question(q: "What do the letters in the GMT time zone stand for?", a: "Greenwich Mean Time", v: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"]),
                  Question(q: "What is the French word for 'hat'?", a: "Chapeau", v: ["Chapeau", "Écharpe", "Bonnet"]),
                  Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: "Watch", v: ["Notebook", "Handkerchief", "Watch"]),
                  Question(q: "How would one say goodbye in Spanish?", a: "Adiós", v: ["Au Revoir", "Adiós", "Salir"]),
                  Question(q: "Which of these colours is NOT featured in the logo for Google?", a: "Orange", v: ["Green", "Orange", "Blue"]),
                  Question(q: "What alcoholic drink is made from molasses?", a: "Rum", v: ["Rum", "Whisky", "Gin"]),
                  Question(q: "What type of animal was Harambe?", a : "Gorilla", v: ["Panda", "Gorilla", "Crocodile"]),
                  Question(q: "Where is Tasmania located?", a: "Australia", v: ["Indonesia", "Australia", "Scotland"])
                  
    ]
    
    var questionNumber = 0
    var score = 0
    
    
    func  variants () -> [String]  {
        return array[questionNumber].variants
    }
    
    func getQuestionText() -> String {
        return array[questionNumber].text
        
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(array.count)
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < array.count{
            questionNumber += 1
            
            
            
        } else{
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == array[questionNumber].answer{
            score += 1
            
            return true
        }else{
            return false
        }
    }
    
}

