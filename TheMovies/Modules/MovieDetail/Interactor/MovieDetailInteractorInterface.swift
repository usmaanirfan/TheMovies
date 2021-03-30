//
//  MovieDetailInteractorInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Interface confirmed by interactor*/
import Foundation
protocol MovieDetailInteractorInterface {
    func fetchMovieDetail(movieId : Int)
    func getPosterUrl(subEndpoint : String)->URL?
}
