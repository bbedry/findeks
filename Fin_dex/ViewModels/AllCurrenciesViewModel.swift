//
//  AllCurrenciesViewModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation


protocol AllCurrenciesViewModelProtocol {
    func requestAllCurrencies()
}


final class AllCurrenciesViewModel: AllCurrenciesViewModelProtocol {
  
    
    public var didSuccess: ()->() = {}
    public var didFailure: (String)->() = {_ in}
    
    private var currenciesData: CurrenciesModel?
    
    func requestAllCurrencies() {
        LastestCurrenciesReques(start: 1, limit: 100).request { [weak self] response in
            guard let self = self else { return }
            self.currenciesData = response?.entity
            self.didSuccess()
        } failure: { (error) in
            self.didFailure(error.message ?? "")
        }
    }
    
}
