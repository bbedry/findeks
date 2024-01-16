//
//  LastestCurrenciesRequest.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Alamofire

struct LastestCurrenciesRequest: RequestObjectDelegate {
    
    typealias ResultObject = BaseResponseModel
    
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
        
    init(start: Int?, limit: Int?, sort: String?, currencyType: String?) {
        
        path = "listings/latest"
        parameters = [:]
        parameters!["start"] = start
        parameters!["limit"] = limit
        parameters!["sort"] = sort
        parameters!["cryptocurrency_type"] = currencyType
    }
}
