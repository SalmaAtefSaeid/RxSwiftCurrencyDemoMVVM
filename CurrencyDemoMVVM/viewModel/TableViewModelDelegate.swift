//
//  TableViewModelDelegate.swift
//  CurrencyDemoMVVM
//
//  Created by JETS Mobile Lab-12 on 5/28/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

protocol TableViewModelDelegate {
    
    func connect()
    func convertToRateList(currency: Currency)
}
