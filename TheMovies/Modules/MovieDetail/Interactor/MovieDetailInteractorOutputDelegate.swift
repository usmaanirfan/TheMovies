//
//  MovieDetailInteractorOutputDelegate.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Protocol to delegate response back to presenter from interactor*/
import Foundation
protocol MoviesDetailInteractorOutputDelegate : class {
    func didFetchMovieDetail(movieDetail : MovieDetail?)
    func didGetErrorInMovieDetail(_ errr: Error)
}
