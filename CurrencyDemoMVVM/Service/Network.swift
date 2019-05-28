//
//  Network.swift
//  CurrencyDemoMVVM
//
//  Created by JETS Mobile Lab-12 on 5/28/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

import Foundation
import RxAlamofire
import RxCocoa
import RxSwift

class Network: NetworkDelegate{
    
    let disposeBag = DisposeBag()
    
    func connect(url: String) -> Observable<(HTTPURLResponse, Any)>{
        
        return RxAlamofire.requestJSON(.get, url)
    }
    
}

