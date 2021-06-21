//
//  MovieModel.swift
// LastMileAssessment
//
//  Created by naeem alabboodi  on 11/04/21.
//

import Foundation
import UIKit

struct MovieModel: Codable {
    let created_by: String
    let description: String
    let favorite_count: Int
    let id: String
    let items: [MovieDetailsModel]
}

//struct ResultModel: Codable {
//    let title: String?
//    let overview: String?
//    let poster_path: String?
//    let genre_ids: [Int]
//}

struct MovieDetailsModel: Codable {
    let title: String?
    let genre_ids: [Int]?
    let popularity: Double?
    let release_date: String?
    let poster_path: String?
    let overview: String?
}


