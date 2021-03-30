//
//  MoviesResponse.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
import ObjectMapper
class MoviesResponse: Mappable {
    var page: Int?
    var movies: [Movie]?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        page    <- map["page"]
        movies  <- map["results"]
    }
}
