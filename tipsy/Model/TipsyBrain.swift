//
//  TipsyBrain.swift
//  tipsy
//
//  Created by Hugo Silva on 08/05/22.
//

import UIKit

struct TipsyBrain {
    
    var total: Double = 0
    var number: Double = 0
    var tip: Double = 0
    var perPerson: Double = 0
    
    mutating func saveData (total: String?, number: String?, tip: Double?) {
        self.total = Double(total!) ?? 0
        self.number = Double(number!) ?? 2
        self.tip = 1 + tip!
        calculatePerPerson()
    }
    mutating func calculatePerPerson () {
        perPerson = round((total*tip/number)*100)/100.0
    }
    func getData (_ data: String) -> Double {
        switch data {
        case "pp":
            return perPerson
        case "tip":
            return tip*100-100
        case "number":
            return number
        default:
            return total
        }
    }
}
