//
//  NetworkManager.swift
//  Kanye
//
//  Created by Aida Moldaly on 28.05.2022.
//

import Foundation

enum NetworkerError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
}

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    private let session: URLSession
    
    func loadKanyeQuote(completion: @escaping (Result<Kanye, Error>) -> Void) {
        guard let url = URL(string: "https://api.kanye.rest/") else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkerError.badData))
                }
                return
            }

            do {
                let kanye = try JSONDecoder().decode(Kanye.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(kanye))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
