//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by dev.geeyong on 2021/01/04.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var BMI: bmi?
    
    mutating func calculateBMI(height: Float, weight: Float){
    
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            BMI = bmi(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if bmiValue < 24.9{
            BMI = bmi(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else{
            BMI = bmi(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
        
    }
    func getBMIValue() -> String{
        
        let bmiTo1Decimalplace = String(format: "%.1f", BMI?.value ?? 0.0)
        return bmiTo1Decimalplace
        
    }
    func getAdvice() -> String {
        return BMI?.advice ?? "error"
    }
    func getColor() -> UIColor{
        return BMI?.color ?? .clear
    }
    
}
