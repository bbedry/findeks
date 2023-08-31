//
//  CodableExtension.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

import Foundation

extension Encodable {
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        return try? encoder.encode(self)
    }
    
}

extension Decodable {
    
    static func decode(_ data: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        return try? decoder.decode(self, from: data)
    }
    
}
