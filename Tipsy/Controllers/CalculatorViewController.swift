//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currentTipAmount: Double = 0.00
    var splitBill: Double = 0.00
    var peopleSplitBy: Double = 1.00
    var billTotal: Double = 0.00
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        switch sender {
        case zeroPctButton:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTipAmount = 0.0
        case tenPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            currentTipAmount = 0.1
        case twentyPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            currentTipAmount = 0.2
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTipAmount = 0.0
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text ?? "0.0")!
        peopleSplitBy = Double(splitNumberLabel.text ?? "1.0")!
        splitBill = round((((billTotal * currentTipAmount) + billTotal) / peopleSplitBy) * 100) / 100.0
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ResultsViewController
        destination.splitBill = splitBill
        destination.billTotal = billTotal
        destination.currentTipAmount = currentTipAmount
        destination.peopleSplitBy = peopleSplitBy
    }
}

