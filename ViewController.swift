//
//  ViewController.swift
//  Tips
//
//  Created by Gaston Tanoira on 8/11/16.
//  Copyright © 2016 Gaston Tanoira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var peopleSlider: UISlider!
    @IBOutlet weak var amountEachPeople: UILabel!
    
    var total = 0.0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveTipSlider(sender: AnyObject) {
        
        view.endEditing(true)
        
        let rounded = Double(Int(tipSlider.value))
        tipPercentage.text = "Tip: " + String(format:"%.0f", rounded) + "%"
        
        if let bill = Double(billAmount.text!) {
            let tip = rounded * bill / 100
            tipAmount.text = "$" + String(format:"%.2f", tip)
            total = bill + tip
            totalAmount.text = "$" + String(format:"%.2f", total)
            updateEach()
            
            
        }

        
    }
    

    @IBAction func movePeopleSlider(sender: AnyObject) {
        updateEach()
    }
    
    
    func updateEach() {
        let people = Int(peopleSlider.value)
        numberOfPeople.text = "Split: \(people)"
        let each = total / Double(people)
        amountEachPeople.text = "$" + String(format:"%.2f", each)
    }

}

