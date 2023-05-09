//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
   
    
    
    
     var quizBrain = QuizBrain()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        update()
       
    }

    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotRight = quizBrain.checkAnswer(userAnswer)
       
        
        
        
        if userGotRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
       
        quizBrain.nextQuestion()

        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
    
    }
    
    
    

    @objc func update(){
        
        let answers = quizBrain.variants()
        
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    
//        firstButton.setTitle(quizBrain.array[quizBrain.questionNumber].variants[0], for: .normal)
//        secondButton.setTitle(quizBrain.array[quizBrain.questionNumber].variants[1], for: .normal)
//        thirdButton.setTitle(quizBrain.array[quizBrain.questionNumber].variants[2], for: .normal)
        
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
    
    
}
 
