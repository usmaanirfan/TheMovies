//
//  MoviesListPresenterOutputDelegate.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Protocol to delegate response back to view from presenter*/
import Foundation
protocol MoviesListPresenterOutputDelegate : class{
    func showMovies()
    func showError(errorModel : ErrorMovieViewModel)
    func showLoading()
    func hideLoading()
}
