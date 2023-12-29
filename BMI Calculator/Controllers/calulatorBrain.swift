//
//  calulatorBrain.swift
//  BMI Calculator
//
//  Created by Sampath Kumar Lam on 26/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    mutating func calculateBmi(height: Float, weight: Float) -> Float{
        let bmiValue = weight/powf(height, 2)
        if bmiValue>24.9 {
            bmi = BMI(value: bmiValue, suggestion: "It's better to cut some calories", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) )
        } else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, suggestion: "No worries! everything's fine", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else{
            bmi = BMI(value: bmiValue, suggestion: "Eat some more snacks", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        return bmiValue
    }
    func getBMIString() -> String{
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiString
    }
    func predictSuggestion() -> String{
        return bmi!.suggestion
    }
    func predictColor() -> UIColor{
        return (bmi?.color)!
    }
}
