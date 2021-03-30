//
//  TranslationLayer.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Translation layer to translate data to Swift objects*/
import Foundation
import SwiftyJSON
import ObjectMapper

struct TranslationLayer: TranslationInterface {
    func createMoviesFromJsonData(_ data: Data) -> [Movie]? {
        var moviesResponse : MoviesResponse?
        if let json = try? JSON(data: data).dictionaryObject {
            moviesResponse = Mapper<MoviesResponse>().map(JSON: json)
        }
        return moviesResponse?.movies
    }

    func createMovieDetailFromJsonData(_ data: Data) -> MovieDetail? {
        var movieDetail : MovieDetail?
        if let json = try? JSON(data: data).dictionaryObject {
            movieDetail = Mapper<MovieDetail>().map(JSON: json)
        }
        return movieDetail
    }
}
