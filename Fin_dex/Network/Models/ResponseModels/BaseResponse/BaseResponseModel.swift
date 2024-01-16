//
//  BaseResponseModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation

class BaseResponseModel: Codable {
    
    var status: CurrencyStatus?
    var data: [CurrencyResponse]?

    enum CodingKeys: String, CodingKey {
        case status
        case data = "data"
    }
}
