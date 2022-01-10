//
//  Popular.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import Foundation
struct PopularMovieResponse: Codable {
    let results: [Popular]
}

struct Popular: Codable {
    let id: Int
    let media: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double
}
