//
//  Genere.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//

import Foundation
import ObjectMapper
class Genere: Mappable {
    var id: Int?
    var name: String?
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        id             <- map["id"]
        name            <- map["name"]
    }
}
