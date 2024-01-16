//
//  AllCurrenciesViewModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation


protocol AllCurrenciesViewModelProtocol {
    func requestAllCurrencies()
    func currencyCount() -> Int?
    func getCurrenciesItem(index: Int) -> CurrencyResponse?
}


final class AllCurrenciesViewModel: AllCurrenciesViewModelProtocol {
  
    
    public var didSuccess: ()->() = {}
    public var didFailure: (String)->() = {_ in}
    
    private var currenciesData: [CurrencyResponse]?
    
    func requestAllCurrencies() {
        
        LastestCurrenciesRequest(start: 1, limit: 3, sort: "market_cap", currencyType: "all").request { [weak self] response in
            guard let self = self else { return }
            self.currenciesData = response?.data
            self.didSuccess()
            
        } failure: { (error) in
            self.didFailure(error.message ?? "")
        }

    
    }
    
    func currencyCount() -> Int? {
        return currenciesData?.count
    }
    
    func getCurrenciesItem(index: Int) -> CurrencyResponse? {
        return currenciesData?[index]
    }
    
}
