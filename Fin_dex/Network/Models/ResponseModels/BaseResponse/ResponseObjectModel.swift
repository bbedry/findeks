//
//  ResponseObjectModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation

class ResponseObjectModel<T: Codable>: BaseResponseModel {
    
    var entity: [T?]
    
    enum CodingKeys: String, CodingKey {
        case entity = "data"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            entity = try container.decode([T].self, forKey: .entity)
            try super.init(from: decoder)
        } catch {
            print("decoding error: \(error)")
            throw error
        }
        
    }

}
