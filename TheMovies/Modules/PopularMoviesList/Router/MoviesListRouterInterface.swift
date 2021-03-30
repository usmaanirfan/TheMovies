//
//  MoviesListRouterInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Intercase to be confirmed by Router of PopularMovieList module */
import UIKit
protocol MoviesListRouterInterface {
    static func createMoviesListListModule() -> UIViewController
    func pushMovieDetailController(from view: MoviesListPresenterOutputDelegate, movieId: Int)
}
