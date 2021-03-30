//
//  TranslationInterface.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Interface confimed by translation layer*/
import Foundation
protocol TranslationInterface {
    func createMoviesFromJsonData(_ data: Data) -> [Movie]?
    func createMovieDetailFromJsonData(_ data: Data) -> MovieDetail?
}
