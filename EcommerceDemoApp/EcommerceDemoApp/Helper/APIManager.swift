//
//  APIManager.swift
//  EcommerceDemoApp
//
//  Created by Ravi Kumar Singh on 27/05/24.
//

import Foundation
//Singelton Design Pattern
protocol APIManagerProtocol {
    func request<T: Decodable>(modelType: T.Type, type: EndPointType, completion: @escaping (Result<T, Error>) -> Void)
}
enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
}

typealias ResultHandler<T> = (Result<T, DataError>) -> Void

final class APIManger: APIManagerProtocol {
    
    static let shared = APIManger()
    
    func request<T: Decodable>(modelType: T.Type, type: EndPointType, completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = type.url else { return  }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "NoDataError", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
        
    }
}
