//
//  APICaller.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import Foundation

struct constants {
    static let API_KEY = "fe5a2faeacd1a0b9a75a2e379bc0c873"
    static let baseURL = "https://api.themoviedb.org/"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)/3/trending/all/day?api_key=\(constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
           
        }
        task.resume()
    }
    
}
