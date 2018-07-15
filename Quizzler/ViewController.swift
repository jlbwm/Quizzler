//
//  ViewController.swift
//  Quizzler
//
//  Created by Jason on 13/07/2018.
//  Copyright © 2018年 Jiaxin Li. All rights reserved.
//

//TODO: updataUI can be done using the didSet method.

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    
    var pickedAnswer = false
    
    var questionNumber = 0

    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressLabel.text = "1/\(allQuestions.list.count)"
        scoreLabel.text = "Score: 0"
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1
        {
            pickedAnswer = true
        }
        else if sender.tag == 2
        {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        if questionNumber < allQuestions.list.count
        {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions,start over?", preferredStyle: .alert)
            
            //alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer
        {
            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        }
        else
        {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    func startOver() {
        
        questionNumber = 0
        
        nextQuestion()
        
        score = 0
    }
    
    func updateUI() {
    
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionNumber + 1)/ \(allQuestions.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
}
