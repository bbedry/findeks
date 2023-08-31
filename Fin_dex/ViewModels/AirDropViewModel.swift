//
//  AirDropViewModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

import Foundation

protocol AirDropViewModelProtocol {
    func requestAirDropCoin(id: String?)
}

class AirDropViewModel: AirDropViewModelProtocol {
    public var didSuccess: ()->() = {}
    public var didFailure: ()->() = {}
    
    private var airDropData: AllCoinMarketModel?
    
    init() {
        
    }
    
    func requestAirDropCoin(id: String?) {
        AirDropRequest(id: "60e59b99c8ca1d58514a2322").request { [weak self] response in
            guard let self = self else { return }
            self.airDropData = response?.entity
            print("\(airDropData)")
        } failure: { (error) in
            print("\(error)")
        }
    }
}
