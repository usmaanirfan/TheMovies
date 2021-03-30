//
//  MovieDetail.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
import ObjectMapper
class MovieDetail: Mappable {
    var adult: Bool?
    var backdropPath: String?
    var budget: Int?
    var genres: [Genere]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var posterPath:String?
    var popularity: Double?
    var productionCompanies: [ProductionCompanies]?
    var title:String?
    var voteAverage:Double?
    var voteCount:Int?
    var releaseDate:String?
    var spokenLanguages: [SpokenLanguage]?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        adult                <- map["adult"]
        backdropPath         <- map["backdrop_path"]
        budget               <- map["budget"]
        genres               <- map["genres"]
        id                   <- map["id"]
        originalLanguage     <- map["original_language"]
        originalTitle        <- map["original_title"]
        overview             <- map["overview"]
        posterPath           <- map["poster_path"]
        popularity           <- map["popularity"]
        productionCompanies  <- map["production_companies"]
        title                <- map["title"]
        voteAverage          <- map["vote_average"]
        voteCount            <- map["vote_count"]
        releaseDate          <- map["release_date"]
        spokenLanguages      <- map["spoken_languages"]
    }
}
