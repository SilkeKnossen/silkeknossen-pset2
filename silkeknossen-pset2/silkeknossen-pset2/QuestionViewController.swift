//
//  QuestionViewController.swift
//  silkeknossen-pset2
//
//  Created by Silke Knossen on 17/11/2018.
//  Copyright © 2018 Silke Knossen. All rights reserved.
//

import UIKit
import Foundation

class QuestionViewController: UIViewController {
    
    // Initialize a Story.
    var story: Story!
    
    // Initialize a word index number.
    var wordIndex: Int = 0

    // Create all outlets.
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitAnswerButton: UIButton!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var wordsLeftLabel: UILabel!
    
    // When the view did load, set navigation title to the number of the current word
    // and update labels of the view with placeholder details.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Word #\(wordIndex+1)"
        typeLabel.text = "Please fill in a " + story.nextPlaceholder!
        wordsLeftLabel.text = String(story.remainingPlaceholders) + " words left to fill in"
    }
    
    // Update the labels of the view with placeholder details.
    func updateUI() {
        navigationItem.title = "Word #\(wordIndex+1)"
        answerTextField.text = ""
        typeLabel.text = "Please fill in a " + story.nextPlaceholder!
        wordsLeftLabel.text =  String(story.remainingPlaceholders) + " words left to fill in"
    }
    
    // When submit button is pressed, fill in this word in the Story.
    @IBAction func submitButtonPressed(_ sender: Any) {
        story.fillInPlaceholder(word: answerTextField.text!)
        nextWord()
    }
    
    // Go to the next placeholder if there is any, otherwise go to result view.
    func nextWord() {
        wordIndex += 1
        
        if wordIndex < story.totalPlaceholders {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    // Give the Story to the result view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.fullStory = story
        }
    }
    
    
    
    

}
