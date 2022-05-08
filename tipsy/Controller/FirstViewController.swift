//
//  ViewController.swift
//  tipsy
//
//  Created by Hugo Silva on 07/05/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipAmount: Double = 0
    var tipsyBrain = TipsyBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if let title = sender.currentTitle {
            if title == "0%" {
                zeroPctButton.isSelected = true
                tipAmount = 0
            } else if title == "10%" {
                tenPctButton.isSelected = true
                tipAmount = 0.1
            } else {
                twentyPctButton.isSelected = true
                tipAmount = 0.2
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipsyBrain.saveData(total: billTextField.text, number: splitNumberLabel.text, tip: tipAmount)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.perPerson = tipsyBrain.getData("pp")
            destinationVC.splitNumber = tipsyBrain.getData("number")
            destinationVC.tipPercentage = tipsyBrain.getData("tip")
        }
    }
}

