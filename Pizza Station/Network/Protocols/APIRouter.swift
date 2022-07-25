//
//  APIRouter.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/5/21.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: Parameters? {get}
    var encoding: ParameterEncoding {get}
}

extension APIRouter{
    func asURLRequest() throws -> URLRequest {
        guard var url = URL(string: NetworkConstants.baseUrl) else{
            throw PizzaErrors.URLNotValid
        }
        url.appendPathComponent(path)
        let request = try URLRequest(url: url, method: method, headers: nil)
        
        return try encoding.encode(request,with: parameters)
    }
}
