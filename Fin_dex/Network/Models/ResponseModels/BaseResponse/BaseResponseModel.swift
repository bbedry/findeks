//
//  BaseResponseModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation

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
