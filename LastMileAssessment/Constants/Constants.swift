//
//  Constants.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi  on 11/04/21.
//

import Foundation

struct Constants {
    struct API {
        static let MOVIES_URL = "https://api.themoviedb.org/3/list/1?api_key="
        static let GENRES_URL = "https://api.themoviedb.org/3/genre/movie/list?api_key="
        static let IMAGE_URL = "https://image.tmdb.org/t/p/w500"
    }
    
    struct Keys {
        static let API_KEY = "0a24180041f6b1f51f7bc4d911edf177"
    }
    
    struct TableCells {
        static let movieCell = "MoviesCell"
        static let noMovieCell = "NoMoviesCell"

    }
}
