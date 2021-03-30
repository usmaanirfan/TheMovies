//
//  Movie.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
import ObjectMapper
class Movie: Mappable {
    var adult: Bool?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath:String?
    var title:String?
    var voteAverage:Double?
    var voteCount:Int?
    var releaseDate:String?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        adult             <- map["adult"]
        id                <- map["id"]
        originalLanguage  <- map["original_language"]
        originalTitle     <- map["original_title"]
        overview          <- map["overview"]
        popularity        <- map["popularity"]
        posterPath        <- map["poster_path"]
        title             <- map["title"]
        voteAverage       <- map["vote_average"]
        voteCount         <- map["vote_count"]
        releaseDate       <- map["release_date"]
    }
}
