//
//  ViewController.swift
//  TipCalculator
//
//  Created by Taylor McLaughlin on 9/14/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static var tipPercentages = [0.15, 0.2, 0.22]
    let initialPercentages = [0.15, 0.2, 0.22]
    
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBAction func tipChanged(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * ViewController.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        
    }
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 125/255, green: 200/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 125/255, green: 200/255, blue: 255/255, alpha: 1)
        tipLabel.isHidden = true
        tipAmountLabel.isHidden = true
        totalLabel.isHidden = true
        totalAmountLabel.isHidden = true
        billField.becomeFirstResponder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setTipControl()
        billField.becomeFirstResponder()
        tipControl.selectedSegmentIndex = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * ViewController.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        
        if billField.text == "" {
            tipLabel.isHidden = true
            tipAmountLabel.isHidden = true
            totalLabel.isHidden = true
            totalAmountLabel.isHidden = true
        } else {
            tipLabel.isHidden = false
            tipAmountLabel.isHidden = false
            totalLabel.isHidden = false
            totalAmountLabel.isHidden = false
        }
        
    }
    
    func setTipControl() {
        
        if ViewController.tipPercentages[0] != initialPercentages[0] {
            tipControl.removeSegment(at: 0, animated: true)
            tipControl.insertSegment(withTitle: "\(Int(ViewController.tipPercentages[0] * 100 + 0.99))%", at: 0, animated: true)
        }
        if ViewController.tipPercentages[1] != initialPercentages[1] {
            tipControl.removeSegment(at: 1, animated: true)
            tipControl.insertSegment(withTitle: "\(Int(ViewController.tipPercentages[1] * 100 + 0.99))%", at: 1, animated: true)
        }
        if ViewController.tipPercentages[2] != initialPercentages[2] {
            tipControl.removeSegment(at: 2, animated: true)
            tipControl.insertSegment(withTitle: "\(Int(ViewController.tipPercentages[2] * 100 + 0.99))%", at: 2, animated: true)
        }
        
    }
    
}

