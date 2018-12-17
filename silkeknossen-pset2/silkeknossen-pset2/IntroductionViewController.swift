//
//  ViewController.swift
//  silkeknossen-pset2
//
//  Created by Silke Knossen on 16/11/2018.
//  Copyright © 2018 Silke Knossen. All rights reserved.
//

import UIKit
import Foundation

class IntroductionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Create Outlet for picker.
    @IBOutlet weak var picker: UIPickerView!
    
    // Set picker data.
    let pickerOptions = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
    
    // Initialize story type that is selected.
    var selectedStory: String = ""
    
    // Initialize the story text.
    var storyText: String = ""
    
    // Initialize a Story.
    var thisStory: Story = Story(withText: "")

    // When the view did load, load the data into the picker.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
    }

    // Handle memory warnings.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Set columns of picker to 1.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // Set rows of picker to number of elements in the picker data array.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }

    // Load one element of picker data array into a picker row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }

    // Set the selected element from the picker as the story type.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedStory = pickerOptions[row]
    }
    
    // Load and decode content of selected path.
    func content(_ path:String)->String? {
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8) as String
            return content
        } catch {
            return nil
        }
    }
    
    // When start button is pressed, load the story of the selected story type.
    @IBAction func StartButtonPressed(_ sender: Any) {
        var filepath: String = ""
        
        switch selectedStory {
        case "Simple":
            filepath = String(Bundle.main.resourcePath! + "/madlib0_simple.txt")
        case "Tarzan":
            filepath = String(Bundle.main.resourcePath! + "/madlib1_tarzan.txt")
        case "University":
            filepath = String(Bundle.main.resourcePath! + "/madlib2_university.txt")
        case "Clothes":
            filepath = String(Bundle.main.resourcePath! + "/madlib3_clothes.txt")
        case "Dance":
            filepath = String(Bundle.main.resourcePath! + "/madlib4_dance.txt")
        default:
            filepath = String(Bundle.main.resourcePath! + "/madlib0_simple.txt")
        }
        
        do {
            storyText = try NSString(contentsOfFile: filepath, encoding: String.Encoding.utf8.rawValue) as String
        }
        catch let error as NSError {
            print("Something went wrong. \(error)")
        }
        
        thisStory = Story(withText: storyText)
    }
    
    // Give the Story to the question view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuestionsSegue" {
            let navigationController = segue.destination as! UINavigationController
            let questionViewController = navigationController.viewControllers.first as! QuestionViewController
            questionViewController.story = thisStory
        }
    }
    
    // Make unwinding to this controller possible.
    @IBAction func unwindToIntroduction(segue:
        UIStoryboardSegue) {
    }

}

