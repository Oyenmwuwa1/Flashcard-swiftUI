//
//  InputViewController.swift
//  oigiede__proj5
//
//  Created by Oyenmwuwa Igiede on 10/23/23.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var qInput: UITextField!
    
    
    @IBOutlet weak var aInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qInput.delegate = self
        aInput.delegate = self
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
    
    @IBAction func addNewCard(_ sender: Any) {
        
        // Read the question and answer from the text fields
               if let question = qInput.text, !question.isEmpty, let answer = aInput.text, !answer.isEmpty {
                   // Append the new card to the stacks questions.append("") answers.append("")
                   questions.append(question)
                   answers.append(answer)
                   // Optionally, you can clear the text fields after adding the card
                   qInput.text = ""
                   aInput.text = ""
                   displayAlert(msgTitle: "Card added Successfully", msgContent: "")
               } else {
                   // Show an alert if the question or answer is empty
                   displayAlert(msgTitle: "Error", msgContent: "Both question and answer are required.")
               }
           }
       }
    
