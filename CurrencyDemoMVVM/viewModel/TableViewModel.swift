//
//  TableViewModel.swift
//  CurrencyDemoMVVM
//
//  Created by JETS Mobile Lab-12 on 5/28/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation
import RxSwift

class TableViewModel: TableViewModelDelegate {
    
    var network : NetworkDelegate = Network()
    var subject = PublishSubject<Rate>()
    var rateObservable : Observable<Rate>?
    var apiUrl = "https://api.exchangeratesapi.io/latest"
    
    init() {
        rateObservable = subject.asObservable()
        self.connect()
    }
    
    func connect(){
        
        network.connect(url: apiUrl).subscribe(onNext: { [weak self] (r, json) in
            if let responce = json as? [String: AnyObject] {
                do{
                    let jsonResponce = try JSONSerialization.data(withJSONObject: responce, options: .prettyPrinted)
                    let currency = try JSONDecoder().decode( Currency.self, from: jsonResponce)
                    let currencyList = self?.convertToRateList(currency: currency)
                }catch let error{
                    print(error.localizedDescription)
            }
            
        }
        
        
    })
    }
    
    func convertToRateList(currency: Currency){
        for rate in currency.rates{
            var currencyRate = Rate(currency: rate.key, currencyRate: rate.value)
            subject.onNext(currencyRate)
        }
    }
}
