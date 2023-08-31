//
//  BaseResponseModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

class BaseResponseModel: Codable {
    
    var error: ErrorResponseModel?
    var success: Bool?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case error
        case success
        case message
    }
}
