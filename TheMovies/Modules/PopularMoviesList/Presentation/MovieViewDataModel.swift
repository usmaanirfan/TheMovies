//
//  MovieViewDataModel.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**view data models to be used by PopularMoviesList views*/
import Foundation

struct MovieViewDataModel {
    let title : String
    let posterURL : URL?
}

struct ErrorMovieViewModel {
    let title : String
    let message : String
}
