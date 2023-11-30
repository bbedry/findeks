//
//  RequestDelegate.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Alamofire

protocol RequestDelegate {
    
    var path: String {get}
    var method: HTTPMethod {get}
    var parameters: Parameters? {get set}
    var enconding: ParameterEncoding? {get set}
}
