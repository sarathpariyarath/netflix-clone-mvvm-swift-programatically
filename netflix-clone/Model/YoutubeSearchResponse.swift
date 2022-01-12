//
//  YoutubeSearchResults.swift
//  netflix-clone
//
//  Created by Sarath P on 12/01/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElements]
}

struct VideoElements: Codable {
    let id: IdVideoElements
}

struct IdVideoElements: Codable {
    let kind: String
    let videoId: String
}

/*
 items =     (
             {
         etag = "OxPhqT7_UAUmeEIYVJLDv031Mys";
         id =             {
             kind = "youtube#video";
             videoId = "Jae5T_RSxYc";
         };
         kind = "youtube#searchResult";
     }
 */
