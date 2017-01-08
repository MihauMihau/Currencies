//
//  ViewController.swift
//  Currency
//
//  Created by Michał Michał on 06.01.2017.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import PKHUD

class DownloadCurrencyVC: UIViewController {
    
    @IBOutlet weak var downloadCurrencyButton: UIButton!
    var downloadCurrency = APIQuery()
    var listOfCurrency = [String]()
    var listOfPrefixes = [String]()
    let chooseCurrencySegue = "chooseCurrency"
    var dataIsDownloaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Download list of currencies"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func downloadCurrencyTapped(_ sender: Any) {
        self.getCurrency { () -> () in
            self.segueToChooseCurrency()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == chooseCurrencySegue {
            let vc = segue.destination as! ChooseCurrencyVC
            vc.listOfCurrency = listOfCurrency
            vc.listOfPrefixes = listOfPrefixes
        }
    }
    
    func segueToChooseCurrency() {
        self.performSegue(withIdentifier: self.chooseCurrencySegue, sender: self)
    }
    
    func getCurrency(handleComplete:@escaping (()->())) {
        HUD.show(.progress)
        self.downloadCurrency.getCurrency(Const.api, completion: { (currency, success) in
            if success {
                for e in currency {
                    self.listOfCurrency.append(e.name!)
                    self.listOfPrefixes.append(e.key!)
                }
                HUD.flash(.success, delay: 1.0)
                handleComplete()
            } else {
                HUD.flash(.labeledError(title: "Connection error", subtitle: "Check Your Internet connection"), delay: 2.0)
            }
        })
    }
    
    @IBAction func unwindToDownload(_ segue:UIStoryboardSegue) {
    }
}

