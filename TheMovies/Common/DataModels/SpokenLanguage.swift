//
//  SpokenLanguage.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//

import Foundation
import ObjectMapper
class SpokenLanguage: Mappable {
    var englishName: String?
    var ISO: String?
    var name: String?
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        englishName     <- map["english_name"]
        ISO             <- map["iso_639_1"]
        name            <- map["name"]
    }
}
