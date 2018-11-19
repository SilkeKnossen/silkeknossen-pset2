//
//  ResultViewController.swift
//  silkeknossen-pset2
//
//  Created by Silke Knossen on 17/11/2018.
//  Copyright © 2018 Silke Knossen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var fullStoryLabel: UILabel!
    var fullStory: Story!
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        fullStoryLabel.text = fullStory.normalText
    }
    

}
