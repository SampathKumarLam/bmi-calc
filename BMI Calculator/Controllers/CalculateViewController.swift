//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()
    var bmiStringValue = "0.0"
    var bmiFloatValue: Float = 0.0
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightValue = (sender.value * 100).rounded()/100
        heightLabel.text = "\(String(heightValue))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightValue = Int(sender.value)
        weightLabel.text = "\(String(weightValue))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmiFloatValue = calculatorBrain.calculateBmi(height: height, weight: weight)
        bmiStringValue = calculatorBrain.getBMIString()
        self.performSegue(withIdentifier: "goToResultView", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultView"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = self.bmiStringValue
            destinationVC.suggestionText = calculatorBrain.predictSuggestion()
            destinationVC.color = calculatorBrain.predictColor()
        }
    }
}

