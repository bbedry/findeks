//
//  CurrenciesModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation


struct CurrencyStatus: Codable {
       var timestamp: String?
       var errorCode: Int?
       var elapsed, creditCount: Int?
       var totalCount: Int?

       enum CodingKeys: String, CodingKey {
           case timestamp
           case errorCode = "error_code"
           case elapsed
           case creditCount = "credit_count"
           case totalCount = "total_count"
       }
}



struct CurrencyResponse: Codable {
     var id: Int?
     var name, symbol, slug: String?
     var numMarketPairs: Int?
     var dateAdded: String?
     var tags: [String]?
     var maxSupply, circulatingSupply, totalSupply: Double?
     var infiniteSupply: Bool?
     var cmcRank: Int?
     var selfReportedCirculatingSupply, selfReportedMarketCap, tvlRatio: JSONNull?
     var lastUpdated: String?
     var quote: Quote?

     enum CodingKeys: String, CodingKey {
         case id, name, symbol, slug
         case numMarketPairs = "num_market_pairs"
         case dateAdded = "date_added"
         case tags
         case maxSupply = "max_supply"
         case circulatingSupply = "circulating_supply"
         case totalSupply = "total_supply"
         case infiniteSupply = "infinite_supply"
         case cmcRank = "cmc_rank"
         case selfReportedCirculatingSupply = "self_reported_circulating_supply"
         case selfReportedMarketCap = "self_reported_market_cap"
         case tvlRatio = "tvl_ratio"
         case lastUpdated = "last_updated"
         case quote
     }
}


    struct Quote: Codable {
        var usd: Usd?

        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }



struct Usd: Codable {
    var price, volume24H, volumeChange24H, percentChange1H: Double?
    var percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double?
    var percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double?
    var tvl: JSONNull?
    var lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case tvl
        case lastUpdated = "last_updated"
    }
}




class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
