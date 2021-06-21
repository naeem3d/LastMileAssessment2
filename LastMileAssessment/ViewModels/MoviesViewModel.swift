//
//  MoviesViewModel.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi  on 11/04/21.
//

import Foundation

struct MoviesViewModel: Codable {
    let title: String?
    let genre_ids: [Int]?
    let popularity: Double?
    let release_date: String?
    let poster_path: String?
    let overview: String?
    
    init(movieModel: MovieDetailsModel) {
        self.title = movieModel.title
        self.genre_ids = movieModel.genre_ids
        self.popularity = movieModel.popularity
        self.release_date = movieModel.release_date
        self.poster_path = movieModel.poster_path
        self.overview = movieModel.overview
    }
}

