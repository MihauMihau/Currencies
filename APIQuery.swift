//
//  APIQuery.swift
//  Currency
//
//  Created by Michał Michał on 06.01.2017.
//  Copyright © 2017 Organization. All rights reserved.
//

import Foundation
import Alamofire

class APIQuery: UIViewController {
    
    func isStatusValid(_ c: Int?, url: String) -> Bool {
        if let code = c {
            if !(code >= 200 && code < 300) {
                print("ERROR CODE \(code) in \(url)")
            }
            return code >= 200 && code < 300
        }
        return false
    }
    
    func getCurrency(_ url: String, completion: @escaping (_ currency: [Currency], _ success: Bool) -> Void) {
        Alamofire.request(url, method: .get).responseJSON { response in
            if self.isStatusValid(response.response?.statusCode, url: url) {
                if response.result.isSuccess {
                    if let dictOfCurrency = response.result.value as? [String: AnyObject] {
                        let sortedArrayOfCurrency = dictOfCurrency.sorted(by: { $0.0 < $1.0 })
                        var currList = [Currency]()
                        for e in sortedArrayOfCurrency {
                            let curr = Currency()
                            curr.key = e.0
                            curr.name = e.1 as? String
                            currList.append(curr)
                        }
                        return completion(currList, true)
                    }
                }
            }
            return completion([], false)
        }
    }
}

