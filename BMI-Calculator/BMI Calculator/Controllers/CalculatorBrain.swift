//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by dev.geeyong on 2021/01/04.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var BMI: Float?
    
    mutating func calculateBMI(height: Float, weight: Float) -> Float {
    
        guard self.BMI = (weight / (height * height)) else{
            return 0
        }
        return BMI
        
    }
    func getBMIValue() -> String{
        guard let bmi = String(format: "%.1f", BMI) else{
            return "error"
        }
        return bmi
        
        
    }
}
