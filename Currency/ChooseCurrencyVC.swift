//
//  ChooseCurrencyVC.swift
//  Currency
//
//  Created by Michał Michał on 06.01.2017.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit

class ChooseCurrencyVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var setCurrencyButton: UIButton!
    let changeCurrencySegue = "changeCurrency"
    var listOfCurrency = [String]()
    var listOfPrefixes = [String]()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        currencyNameLabel.text = listOfCurrency[0]
        navigationItem.title = "Choose Your currency"
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
        return listOfCurrency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
        currencyNameLabel.text = listOfCurrency[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == changeCurrencySegue {
            let vc = segue.destination as! ChangeCurrencyVC
            vc.chosenCurrency = currencyNameLabel.text! + " (\(listOfPrefixes[index]))"
            vc.listOfCurrency = listOfCurrency
            vc.listOfPrefixes = listOfPrefixes
        }
    }
    
    @IBAction func setCurrencyButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: changeCurrencySegue, sender: self)
    }
    
}
