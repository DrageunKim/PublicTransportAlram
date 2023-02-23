//
//  Request.swift
//  PublicTransportAlram
//
//  Created by yonggeun Kim on 2023/02/23.
//

import Foundation

protocol Request {
    associatedtype Response: Decodable
    
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Request {
    var baseURL: URL? {
        return URL(string: "http://swopenAPI.seoul.go.kr/api/")
    }
    
    func create() -> URLRequest {
        if let url = baseURL {
            var urlRequest = URLRequest(url: url.appendingPathExtension(path))
            urlRequest.httpMethod = method.rawValue
            
            return urlRequest
        }
        
        return URLRequest(url: URL(fileURLWithPath: String()))
    }
}
