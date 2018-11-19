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
    
    @IBOutlet weak var picker: UIPickerView!
    
    let pickerOptions = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
    
    var selectedStory: String = ""
    var storyText: String = ""
    var thisStory: Story = Story(withText: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedStory = pickerOptions[row]
    }
    
    func content(_ path:String)->String? {
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8) as String
            return content
        } catch {
            return nil
        }
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuestionsSegue" {
            let navigationController = segue.destination as! UINavigationController
            let questionViewController = navigationController.viewControllers.first as! QuestionViewController
            questionViewController.story = thisStory
        }
    }
    
    @IBAction func unwindToIntroduction(segue:
        UIStoryboardSegue) {    
    }

}

