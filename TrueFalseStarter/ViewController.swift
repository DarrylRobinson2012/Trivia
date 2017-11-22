//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var randomIndex = [Int]()
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var score = 0
    var gameSound: SystemSoundID = 0
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultsArea: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        primeTheApp()
        playGameStartSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Set up the welcome screen
    func primeTheApp() {
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        resultsArea.isHidden = true
        questionField.text = " Ready to play some Sports trivia? "
        generateQuestions()
        
    }
    
    
    func displayQuestion() {
        nextQuestion()
        questionField.text = questions[questionIndex].questions
        answer1.setTitle(questions[questionIndex].answers[0], for: UIControlState.normal)
        answer2.setTitle(questions[questionIndex].answers[1], for: UIControlState.normal)
        answer3.setTitle(questions[questionIndex].answers[2], for: UIControlState.normal)
        answer4.setTitle(questions[questionIndex].answers[3], for: UIControlState.normal)
        playAgainButton.isHidden = true
        resultsArea.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        //display results
        resultsArea.isHidden = false
        resultsArea.text = "\(correctQuestions) Out of \(questionsAsked) correct "
        // Display play again button
        playAgainButton.isHidden = false
        playAgainButton.setTitle("Play Again", for: UIControlState.normal)
        
        switch correctQuestions {
        case 0:
            questionField.text = "THATS TERRIBLE"
        case 1:
            questionField.text = " At least you got one question correct"
        case 2:
            questionField.text = " Hey 50cent is half of a dollar."
        case 3:
            questionField.text = " You are have 75% correct"
        case 4:
            questionField.text = " AYYY YOU FYE! You got all of them correct"
        default : break

        }
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let correctAnswer = questions[questionIndex].correctAnswer
        
        if (sender === answer1 &&  correctAnswer == 0) || (sender === answer2 && correctAnswer == 1) ||  (sender === answer3 &&  correctAnswer == 2) || (sender === answer4 && correctAnswer == 3)  {
            correctQuestions += 1
            questionField.text = "Correct!"
            loadNextRoundWithDelay(seconds: 2)
        } else {
            questionField.text = "Sorry, wrong answer!"
            loadNextRoundWithDelay(seconds: 2)
        }
        
       // loadNextRoundWithDelay(seconds: 2)
    }
   


    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        answer4.isHidden = false
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

