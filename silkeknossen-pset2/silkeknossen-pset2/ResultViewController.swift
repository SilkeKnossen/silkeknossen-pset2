//
//  ResultViewController.swift
//  silkeknossen-pset2
//
//  Created by Silke Knossen on 17/11/2018.
//  Copyright © 2018 Silke Knossen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // Create outlet
    @IBOutlet weak var fullStoryLabel: UILabel!
    
    // Initialize the Story variable.
    var fullStory: Story!
    
    // When the view did load, load the filled in story to the view.
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        fullStoryLabel.attributedText = fullStory.attributedText
    }
    

}
