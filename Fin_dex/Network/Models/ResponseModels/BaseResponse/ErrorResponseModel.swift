//
//  ErrorResponseModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//


struct ErrorResponseModel: Codable {
    
    var code: Int?
    var customCode: Int?
    var debugMessage: String?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case customCode
        case debugMessage
        case message
    }
    
}

