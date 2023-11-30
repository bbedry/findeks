//
//  LastestCurrenciesRequest.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Alamofire

struct LastestCurrenciesReques: RequestObjectDelegate {
    
    typealias ResultObject = CurrenciesModel
    
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
        
    init(start: Int?, limit: Int?) {
        
        path = "listings/latest"
        parameters = [:]
        parameters!["start"] = start
        parameters!["limit"] = limit
        
    }
}
