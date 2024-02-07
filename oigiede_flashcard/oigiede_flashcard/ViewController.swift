//
//  ViewController.swift
//  oigiede__proj5
//
//  Created by Oyenmwuwa Igiede on 10/23/23.
//

import UIKit
var questions: [String] = []
var answers: [String] = []
var currentQuestionIndex = 0

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // have pop up window to display message to user
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message:
                                                    msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default,
                                          handler: nil)
    alertController.addAction(defaultAction)
    present(alertController, animated: true, completion: nil)
    }
    @IBAction func go2NextQuestion(_ sender: Any) {
        // check if we have cards yet
        if  questions.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "" )
            return
        }
        // now we know we have at least one card
        currentQuestionIndex = currentQuestionIndex + 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
            
        }
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "????"
    }
    @IBAction func deleteCard(_ sender: Any) {
        // Check if there are cards to delete if no, return
        if questions.isEmpty {
            displayAlert(msgTitle: "No card to delete", msgContent: "")
            return
        }
        
        // Remove the current cardfrom questions and answers   questions.remove(at: currentQuestionIndex)
        questions.remove(at: currentQuestionIndex)
        answers.remove(at: currentQuestionIndex)
        
        // check wheter you still have card(s)If no, return, if yes, adjust  the point if needed
        if questions.isEmpty {
            questionLabel.text = "No cards left"
            answerLabel.text = ""
        } else {
            // Check if the current index is out of bounds after deleting
            if currentQuestionIndex >= questions.count {
                currentQuestionIndex = 0
            }
            // Display the new question and hide the answer with "???"
            questionLabel.text = questions[currentQuestionIndex]
            answerLabel.text = "???"
        }

        // check there is card to delete
        // if no, return
        
        //If yes, you remove the current card
        // from questions and answers    questions.remove(at: currentQuestionIndex)
        
        //check wheter you still have card(s).
        // If no, return
        // if yes, adjust  the point if needed
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        //display the new question, hide the answer with "???"
    }
    
    @IBAction func showMeAnswer(_ sender: Any) {
        if  answers.count == 0 {
            displayAlert(msgTitle: "No card yet", msgContent: "" )
            return
        }
        answerLabel.text = answers[currentQuestionIndex]
    }
    @IBAction func go2InputViewAction(_ sender: Any) {
        performSegue(withIdentifier: "goInputView", sender: nil)
        
    }
}

