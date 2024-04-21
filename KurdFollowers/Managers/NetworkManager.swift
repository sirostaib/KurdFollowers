//
//  NetworkManager.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import Foundation

class NetworkManager {
     
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], KFError>) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                completed(.failure(.noInternet))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let follwers = try decoder.decode([Follower].self, from: data)
                completed(.success(follwers))
            }catch{
                completed(.failure(.decodeError))
            }
        }
            
        task.resume()
    }
}
