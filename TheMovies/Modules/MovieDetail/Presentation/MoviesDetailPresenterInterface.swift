//
//  MoviesDetailPresenterInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Interface confirmed by presenter*/
import Foundation
protocol MoviesDetailPresenterInterface {
    func viewDidLoad()
    var  navigationTitle: String { get }
    func getMovieDetailViewDataModel() -> MovieDetailViewDataModel
}
