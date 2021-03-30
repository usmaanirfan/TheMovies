//
//  MovieDetailPresenterOutputDelegate.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Protocol to delegate response back to view from presenter*/
import Foundation
protocol MovieDetailPresenterOutputDelegate : class{
    func showMovieDetail()
    func showError(errorModel : ErrorMovieDetailViewModel)
    func showLoading()
    func hideLoading()
}
