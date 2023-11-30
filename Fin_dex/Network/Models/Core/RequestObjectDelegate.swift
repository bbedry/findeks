//
//  RequestObjectDelegate.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation

protocol RequestObjectDelegate: RequestDelegate {
    associatedtype ResultObject: Codable
}

extension RequestObjectDelegate {
    
    func request(success: @escaping RequestManager.ObjectClosure<ResultObject>, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: success, failure: failure)
    }    
}
