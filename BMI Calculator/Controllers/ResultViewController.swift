//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sampath Kumar Lam on 26/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var suggestionText: String?
    var color: UIColor?
    var calulatorBrain = CalculatorBrain()
    @IBOutlet weak var bmiResultLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLabel.text = bmiValue
        suggestionLabel.text = suggestionText
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) // to dismiss the current segue and move back to homepage
        
    }
    
}
