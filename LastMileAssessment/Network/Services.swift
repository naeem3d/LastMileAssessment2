//
//  Services.swift
//  TwitterAssessment
//
//  Created by naeem alabboodi  on 11/04/21.
//

import Foundation
import UIKit

class Services {
    
    static let shared = Services()
    
    private init() {  }
        
    //get Movies API
    func getAllTheMovies(urlString: String, completionHandler: @escaping (Result<[MoviesViewModel]?, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        
        if let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: urlStr) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        completionHandler(.failure(error))
                        return
                    } else {
                        let decoder = try! JSONDecoder().decode(MovieModel.self, from: data!)
                        let moviesArray = decoder.items
                        completionHandler(.success(moviesArray.map({MoviesViewModel(movieModel: $0)})))
                    }
                }
                task.resume()
            }
        }
    }
    
    func getAllTheGenres(urlString: String, completionHandler: @escaping (Result<[GenresViewModel]?, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        
        if let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: urlStr) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        completionHandler(.failure(error))
                        return
                    } else {
                        let decoder = try! JSONDecoder().decode(Genres.self, from: data!)
                        let moviesArray = decoder.genres
                        completionHandler(.success(moviesArray.map({GenresViewModel(genreModel: $0)})))
                    }
                }
                task.resume()
            }
        }
    }
    
 
}

