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
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, ErrorMessage?) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                completed(nil, .noInternet)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let follwers = try decoder.decode([Follower].self, from: data)
                completed(follwers, nil )
            }catch{
                completed(nil, .decodeError)
            }
        }
            
        task.resume()
    }
}
