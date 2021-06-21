//
//  GenresViewModel.swift
//  LastMileAssessment
//
//  Created by naeem alabboodi on 20/06/21.
//

import Foundation

struct GenresViewModel {
    let id: Int
    let name: String
    
    init(genreModel: GenresModel) {
        self.id = genreModel.id
        self.name = genreModel.name
    }
}
