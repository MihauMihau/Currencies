//
//  ChangeCurrencyVC.swift
//  Currency
//
//  Created by Michał Michał on 07.01.2017.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit

class ChangeCurrencyVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var chosenCurrencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var changeCurrencyButton: UIButton!
    @IBOutlet weak var startAgainButton: UIButton!
    var chosenCurrency = ""
    var listOfCurrency = [String]()
    var listOfPrefixes = [String]()
    var currencyFromPicker = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        chosenCurrencyLabel.text = chosenCurrency 
        navigationItem.title = "Change Your currency"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfCurrency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfCurrency[row] + " (\(listOfPrefixes[row]))"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         currencyFromPicker = listOfCurrency[row] + " (\(listOfPrefixes[row]))"
    }
    
    @IBAction func changeCurrencyButtonTapped(_ sender: Any) {
        chosenCurrencyLabel.text = currencyFromPicker
    }

    @IBAction func startAgainButtonTapped(_ sender: Any) {
        
    }


}
