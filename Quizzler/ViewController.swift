//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let question = QuesionBank()
    var answerGivenByTheUser = false
    var questionNumber = 0
    var score = 0
    var progess = 0.0
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        
    }
    
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            answerGivenByTheUser = true
        }else if sender.tag == 2 {
            answerGivenByTheUser = false
        }
        
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
        
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score :\(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        
        progressBar.frame.size.width = ((view.frame.size.width) / 13) * CGFloat(questionNumber+1)
        
    }
    
    
    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = question.list[questionNumber].question
            updateUI()
        }else{
            //1. Create the alert controller.
            let alert = UIAlertController(title: "Game End", message: "Do you want to restart", preferredStyle: .alert);
            
            //3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (action) -> Void in
                self.startOver()
                
            }))
            
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        if answerGivenByTheUser == question.list[questionNumber].answere{
            score += 10
            ProgressHUD.showSuccess("Correct")
        }else{
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber=0
        score = 0
        nextQuestion()
    }
}
