//
//  CurrenciesModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation

struct CurrenciesModel: Codable {
    var status: CurrencyStatus?
    var currencyResponse: [CurrencyResponse?]
}

struct CurrencyResponse: Codable {
    var id: Int?
    var name: String?
    var symbol: String?
    var slug: String?
    var cmcRank: Int?
    var numMarketPairs: Int?
    var circulatingSupply: Int?
    var totalSupply: Int?
    var maxSupply: Int?
    var queto: Quote?
    var lastUpdated: String?
    var dateAdded: String?
    var tags: [String?]
}

struct Quote: Codable {
    var usd: QuoteDetail?
    var btc: QuoteDetail?
}

struct QuoteDetail: Codable {
    var price: Double?
    var volume24h: Double?
    var volumeChange24h: Double?
    var percentChange1h: Double?
    var percentChange24h: Double?
    var percentChange7d: Double?
    var marketCap: Double?
    var marketCapDominance: Double?
    var fullyDilutedMarketCap: Double?
    var lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case price
        case volume24h = "volume_24h"
        case volumeChange24h = "volume_change_24h"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case lastUpdated = "last_updated"
     }
}

struct CurrencyStatus: Codable {
    var timeStamp: String?
    var errorCode: Int?
    var errorMessage: String?
    var elapsed: Int?
    var creditCount: Int?
    var notice: String?
    
    enum CodingKeys: String, CodingKey {
        case timeStamp = "timestamp"
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
        case notice
    }
}
