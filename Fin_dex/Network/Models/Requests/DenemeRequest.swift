//
//  DenemeRequest.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

import Alamofire

struct AirDropRequest: RequestObjectDelegate {
    typealias ResultObject = AllCoinMarketModel
    
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var encoding: ParameterEncoding? = JSONEncoding.default
    
    init(id: String?){
        path = "cryptocurrency/airdrop"
        parameters = [:]
        parameters!["id"] = id
    }
}
