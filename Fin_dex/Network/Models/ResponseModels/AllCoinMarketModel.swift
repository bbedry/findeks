//
//  AllCoinMarketModel.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

struct AllCoinMarketModel: Codable {
    var items: [CurrencyItems]?
    var status: CurrencyStatus?
}

struct CurrencyItems: Codable {
    var id: String?
    var projectName: String?
    var description: String?
    var coin: Coin?
    
    enum CodingKeys: String, CodingKey {
        case id
        case projectName = "project_name"
        case description
        case coin
    }
}

struct CurrencyStatus: Codable {
    var timestamp: String?
    var error_code: Int?
    var elapsed: Int?
    var credit_count: Int?
}

struct Coin: Codable {
    var id: Int?
    var name: String?
    var slug: String?
    var symbol: String?
    var startDate: String?
    var endDate: String?
    var totalPrize: Int?
    var winnerCount: Int?
    var link: String?
    
    enum Codingkeys: String, CodingKey {
        case id
        case name
        case slug
        case symbol
        case startDate = "start_date"
        case endDate = "end_date"
        case totalPrize = "total_prize"
        case winnerCount = "winner_count"
        case link
    }
}
