//
//  ViewController.swift
//  CurrencyDemoMVVM
//
//  Created by Salma Atef Saeid on 5/28/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    var viewModel : TableViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel  = TableViewModel()
        viewModel?.rateObservable?.bind(to: myTableView.rx.items(cellIdentifier: "currencyCell", cellType: CurrencyTableViewCell.self)){(row, data, cell) in
                cell.currenyLabel.text = data.currency
                cell.rateLabel.text = String(format: "%f", data.currencyRate)
            }.disposed(by: disposeBag)
    }



}

