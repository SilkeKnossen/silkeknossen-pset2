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
    
    var story: Story!
    var wordIndex: Int = 0

    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitAnswerButton: UIButton!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var wordsLeftLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Word #\(wordIndex+1)"
        typeLabel.text = "Please fill in a " + story.nextPlaceholder!
        wordsLeftLabel.text = String(story.remainingPlaceholders) + " words left to fill in"
    }
    
    func updateUI() {
        navigationItem.title = "Word #\(wordIndex+1)"
        answerTextField.text = ""
        typeLabel.text = "Please fill in a " + story.nextPlaceholder!
        wordsLeftLabel.text =  String(story.remainingPlaceholders) + " words left to fill in"
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        story.fillInPlaceholder(word: answerTextField.text!)
        nextWord()
    }
    
    func nextWord() {
        wordIndex += 1
        
        if wordIndex < story.totalPlaceholders {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.fullStory = story
        }
    }
    
    
    
    

}
