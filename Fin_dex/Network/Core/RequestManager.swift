//
//  RequestManager.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 31.08.2023.
//

import Alamofire

class RequestManager {
    
    typealias ObjectClosure<T: Codable> = ((ResponseObjectModel<T>?) -> Void)
    typealias ErrorClosure = ((ErrorResponseModel) -> Void)
    
    static let errorCodeConnection = "error.connection"
    static let errorCodeLocal = "error.local"
    static let errorCodeUnknown = "error.unknown"
    
    static var apiURL: String {
        get {
            return "https://pro-api.coinmarketcap.com"
        }
    }
    
    private static func createRequest(_ request: RequestDelegate) -> DataRequest {
        print("Fin_deks-RequestPath: \(request.path)")
        print("Fin_deks-RequestMethod: \(request.method.rawValue)" + " || " + "RequestParameters:", (request.parameters ?? "nil"))
        let request = AF.request(apiURL+request.path, method: request.method, parameters: request.parameters, encoding: request.encoding!, headers: HTTPHeaders())
        
        request.validate()
        request.responseData { (response) in
            if let value = response.data {
                if let json = String(data: value, encoding: .utf8) {
                    let cleanJson = json.replacingOccurrences(of: "\\/", with: "/")
                    print("Fin_deks-Data:" + cleanJson)
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
                else if let data = response.data {
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] {
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
            /*
             if let json = String(data: data, encoding: .utf8) {
             print("Response JSON: \(json)")
             }
             */
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
    
}
