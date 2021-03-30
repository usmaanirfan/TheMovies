//
//  productionCompanies.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//

import Foundation
import ObjectMapper

class ProductionCompanies: Mappable {
    var id: Int?
    var logoPath: String?
    var name: String?
    var originCountry : String?
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        id             <- map["id"]
        logoPath       <- map["logo_path"]
        name           <- map["name"]
        originCountry  <- map["origin_country"]
    }
}
