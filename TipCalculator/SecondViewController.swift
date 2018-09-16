//
//  SecondViewController.swift
//  TipCalculator
//
//  Created by Taylor McLaughlin on 9/15/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var segmentPicker: UIPickerView!
    @IBOutlet var percentageField: UITextField!
    @IBAction func updatePercentage(_ sender: Any) {
        
        ViewController.tipPercentages[segmentPicker.selectedRow(inComponent: 0)] = Double(percentageField.text!)!/100
        
        percentageField.text = ""
        
    }
    
    
    let segments = ["1", "2", "3"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return segments[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return segments.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 125/255, green: 200/255, blue: 255/255, alpha: 1)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
