//
//  NetworkManager.swift
//  homeworkAPI2
//
//  Created by tamzimun on 29.05.2022.
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
    
    func loadPersonInfo(completion: @escaping (Result<Model, Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/latest?api_key=e516e695b99f3043f08979ed2241b3db") else { return }
        
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
                let person = try JSONDecoder().decode(Model.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(person))
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
