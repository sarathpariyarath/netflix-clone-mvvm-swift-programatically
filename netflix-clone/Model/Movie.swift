//
//  Movie.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
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

/*
 {
adult = 0;
"backdrop_path" = "/r2GAjd4rNOHJh6i6Y0FntmYuPQW.jpg";
"genre_ids" =             (
 12,
 28,
 53
);
id = 370172;
"media_type" = movie;
"original_language" = en;
"original_title" = "No Time to Die";
overview = "Bond has left active service and is enjoying a tranquil life in Jamaica. His peace is short-lived when his old friend Felix Leiter from the CIA turns up asking for help. The mission to rescue a kidnapped scientist turns out to be far more treacherous than expected, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.";
popularity = "1218.24";
"poster_path" = "/iUgygt3fscRoKWCV1d0C7FbM9TP.jpg";
"release_date" = "2021-09-29";
title = "No Time to Die";
video = 0;
"vote_average" = "7.5";
"vote_count" = 3074;
}
 */
