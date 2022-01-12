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
    static let YoutubeAPI_KEY = "AIzaSyA2yf1Tx9wDzCuy7qTDJlXrk9VxxHl6SwA"
    static let Yoututbe_baseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)3/trending/movie/day?api_key=\(constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getTrendingTV(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)3/trending/tv/day?api_key=\(constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getPopularMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)3/movie/popular?api_key=\(constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getUpcomingMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)3/movie/upcoming?api_key=\(constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    func getToprated(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(constants.baseURL)3/movie/top_rated?api_key=\(constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(constants.baseURL)3/discover/movie?api_key=\(constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()
    }
    
    func searchWithQuery(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(constants.baseURL)3/search/movie?api_key=\(constants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
           
        }
        task.resume()

    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElements, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(constants.Yoututbe_baseURL)q=\(query)&key=\(constants.YoutubeAPI_KEY)") else {return}
        print (url)
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
            } catch {
                completion(.failure(error))
                print(error)
            }
           
        }
        task.resume()
    }
}

