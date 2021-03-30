//
//  MoviesListInteractorOutputDelegate.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Protocol to delegate response back to presenter from interactor*/
import Foundation
protocol MoviesListInteractorOutputDelegate : class {
    func didFetchMovies(movies : [Movie]?)
    func didGetErrorInMovies(_ errr: Error)
}
