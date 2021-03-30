//
//  MoviesListInteractorInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Interface confirmed by interactor*/
import Foundation
protocol MoviesListInteractorInterface {
    func fetchPopularMovies()
    func getPosterUrl(subEndpoint : String)->URL?
    func topMovies(with number : Int) -> [Movie]?
}
