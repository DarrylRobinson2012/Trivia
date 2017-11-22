//
//  questionProvider.swift
//  TrueFalseStarter
//
//  Created by Darryl_Programming_account on 11/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit


struct Trivia {
    var questions : String
    var answers = [String]()
    var correctAnswer = Int()
    
}
// Question Data
let questions: [Trivia]  = [ Trivia(questions: "Which of the following basketball player's gets the most buckets? ",
                                    answers: ["Steph Curry", "Lebron James", "Kevin Durant", " James Harden"],
                                    correctAnswer: 0),
                             Trivia(questions: "Who is the best Wide Reciver in the NFL?",
                                    answers: ["Antonio Brown", "Julio Jones", "Odell Beckham", "Deiondre Hopkins"],
                                    correctAnswer: 1),
                             Trivia(questions: "What tema did Micheal Jordan play on?",
                                    answers: ["Spurs", "Hawks", "Heat", "Bulls"],
                                    correctAnswer: 3),
                             Trivia(questions: "Which boxer has a 51 - 0 perfect record?",
                                    answers: ["Evander Holifield" , "Floyd Mayweather", "Connor Mcgregor", "Ray Lenard"],
                                    correctAnswer: 1),
                             Trivia(questions: "Which QuarterBack has the most superbowl rings?",
                                    answers:  ["Tom Brady", "Matt Ryan", "Drew Brees", "Phillip Rivers"],
                                    correctAnswer: 0),
                             Trivia(questions: "Which soccer player is the Goat?",
                                    answers: ["Leo Messi", "Neymar Jr", "Cristiano Ronaldo", "Diego Costa "],
                                    correctAnswer: 1),
                             Trivia(questions: "Which baseball tema won the won the world series in 2017?",
                                    answers: ["Astos", "Braves", "Dodgers", "RedSocks"],
                                    correctAnswer: 0),
                             Trivia(questions: "Which sport is Micheal Phelps active in?",
                                    answers: ["Basketball", "Tennis", "Swimming", "Track"],
                                    correctAnswer: 2) ]
    
// Generating a set based on questions
    var roundQuestions = [Int]()
    var questionIndex = 0

    func generateQuestions() {
        var i = 0

        while i < questions.count {
            roundQuestions.append(i)
            i += 1
}
}

    func nextQuestion() {
            questionIndex = roundQuestions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: roundQuestions.count))

}
