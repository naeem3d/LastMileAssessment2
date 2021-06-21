//
//  GenreModel.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi on 20/06/21.
//

import Foundation

struct Genres: Codable {
    let genres: [GenresModel]
}

struct GenresModel: Codable {
    let id: Int
    let name: String
}
