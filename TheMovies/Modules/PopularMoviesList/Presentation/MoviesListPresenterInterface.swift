//
//  MoviesListPresenterInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Interface confirmed by presenter*/
import Foundation
protocol MoviesListPresenterInterface {
    func viewDidLoad()
    func didSelectFor(index : Int)
    func getMoviesCount() -> Int
    func getMovieViewDataModelFor(index: Int) -> MovieViewDataModel
    var  navigationTitle: String { get }
}
