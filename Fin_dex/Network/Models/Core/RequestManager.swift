//
//  RequestManager.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 30.11.2023.
//

import Foundation
import Alamofire



class RequestManager {
    
    typealias ObjectClosure<T: Codable> = ((ResponseObjectModel<T>?) -> Void)
    typealias ErrorClosure = ((ErrorResponseModel) -> Void)
    
    static let errorCodeConnection = "error.connection"
    static let errorCodeLocal = "error.local"
    static let errorCodeUnknown = "error.unknown"
    
    static var apiUrl: String {
        get {
            return "https://pro-api.coinmarketcap.com/v1/cryptocurrency/"
       
        }
    }
    
    
    private static func createRequest(_ request: RequestDelegate) -> DataRequest {
        print("Path: \(request.path)")
        print("RequestMethod: \(request.method.rawValue)" + " || " + "RequestParameters:", (request.parameters ?? "nil"))
        
        let request  = AF.request(apiUrl+request.path, method: request.method, parameters: request.parameters, encoding: request.enconding!, headers: HTTPHeaders(generateHeader() ?? ["":""]))
        
        print("\(request)")
        
        request.validate()
        request.responseData { (response) in
            if let value = response.data {
                if let json = String(data: value, encoding: .utf8) {
                    let cleanJson = json.replacingOccurrences(of: "\\/", with: "/")
                    print("Data:" + cleanJson)
                }
            }
        }
        return request
    }
    
    static func request<T: Codable>(_ request: RequestDelegate, success: @escaping ObjectClosure<T>, failure: @escaping ErrorClosure) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                if let data = response.data, let model = ResponseObjectModel<T>.decode(data) {
                    success(model)
                }
                     
                // entity nil oldugu icin datayi parse edemedigi ama success dondugu durunmlari kontrol ediyoruz
                else if let data = response.data {
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        let isSuccess = jsonResponse["success"]
                        if (isSuccess ?? false) as! Bool{
                            success(nil)
                        } else {
                            handleFailure(response: response, failure: failure)
                        }
                    }
                } else {
                    handleFailure(response: response, failure: failure)
                }
            case .failure:
                handleFailure(response: response, failure: failure)
            }
        }
    }
    
    
    private static func handleFailure(response: AFDataResponse<Data>, failure: @escaping ErrorClosure) {
        if let statusCode = response.response?.statusCode, statusCode == 401 {
            return
        }
        if let data = response.data, let serviceError = ErrorResponseModel.decode(data) {
            
             if let json = String(data: data, encoding: .utf8) {
             print("Response JSON: \(json)")
             }
             
            handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, failure: failure)
            print("Error = \(String(describing: response.response?.statusCode))")
        } else if let error = response.error {
            handleError(statusCode: nil, localError: error, serviceError: nil, failure: failure)
            print("Error = \(String(describing: failure))")
        } else {
            handleError(statusCode: nil, localError: nil, serviceError: nil, failure: failure)
            print("Error = \(String(describing: failure))")
        }
    }

    private static func handleError(statusCode: Int?, localError: Error?, serviceError: ErrorResponseModel?, failure: @escaping ErrorClosure) {
        if let error = serviceError {
            failure(error)
        } else if let error = localError as? URLError, error.code == .notConnectedToInternet {
            failure(ErrorResponseModel(code: serviceError?.code, debugMessage: serviceError?.debugMessage, message: "Connection Error"))
            print("Error = \(error.localizedDescription)")
        } else if let error = localError {
            failure(ErrorResponseModel(code: serviceError?.code, debugMessage: serviceError?.debugMessage, message: error.localizedDescription))
            print("Error = \(error.localizedDescription)")
        } else {
            failure(ErrorResponseModel(code: serviceError?.code, debugMessage: serviceError?.debugMessage, message: "Unknow Error"))
        }
    }
    
    private static func generateHeader() -> [String: String]? {
        let apiKey = "bb8434fc-928f-4246-b4d2-b422b0252d6d"
        
        
//        parameters["Authorization"] = "bearer \(KeychainHelper.get(key: .token) ?? "")"
        
        return ["X-CMC_PRO_API_KEY": apiKey]
    }
   
}




