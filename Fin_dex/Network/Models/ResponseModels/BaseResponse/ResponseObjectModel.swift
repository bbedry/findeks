//
//  ResponseObjectModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

class ResponseObjectModel<T: Codable>: BaseResponseModel {
    
    var entity: T?
    
    enum CodingKeys: String, CodingKey {
        case entity
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entity = try container.decode(T.self, forKey: .entity)
        try super.init(from: decoder)
    }
    
}
