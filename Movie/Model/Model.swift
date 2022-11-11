//
//  Model.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import Foundation

struct MovieResults: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double

}
