//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jack Anderson on 1/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitBill: Double = 0.00
    var peopleSplitBy: Double = 1.00
    var billTotal: Double = 0.00
    var currentTipAmount: Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(splitBill)
        settingsLabel.text = String("Split between \(String(format: "%.0f", peopleSplitBy)) people, at a tip rate of \(String(currentTipAmount)), with the total bill being \(String(billTotal))")
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
