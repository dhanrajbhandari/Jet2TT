//
//  NetWorkManager.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import Foundation

protocol Service {
    func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void)
}
extension Service {
    
}

class NetWorkManager: Service {
    static let shared: NetWorkManager = NetWorkManager()

    enum NetWorkError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(NetWorkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(NetWorkError.invalidResponse(data, response)))
                    return
            }

            completionBlock(.success(responseData))
        }
        task.resume()
    }
}
