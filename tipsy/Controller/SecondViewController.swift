//
//  SecondViewController.swift
//  tipsy
//
//  Created by Hugo Silva on 07/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var perPerson: Double = 0
    var splitNumber: Double = 0
    var tipPercentage: Double = 0

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(perPerson)"
        settingsLabel.text = "Split between \(Int(splitNumber)) people, with \(Int(tipPercentage))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
