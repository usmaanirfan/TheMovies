//
//  MovieDetailViewDataModel.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**view data models to be used by MovieDetail views*/
import Foundation
struct MovieDetailViewDataModel {
    let title : String
    let posterURL : URL?
    let genresText : String
    let releaseDataText : String
    let overviewText: String
    let langauges : String
}

struct ErrorMovieDetailViewModel {
    let title : String
    let message : String
}
