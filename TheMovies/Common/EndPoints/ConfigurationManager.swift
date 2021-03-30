//
//  ConfigurationManager.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
enum RequestType {
    case loadPopularMovies
    case loadMovieDetail
    case posterImage
}

class ConfigurationManager {
    func buildURL(for requestType : RequestType, subEndpoint: String = "") -> URL? {
        switch requestType {
        case.loadPopularMovies:
            let strURL = "\(EndPoints.moviesBaseURL)\(EndPoints.popularMoviesEndpoint)"
            let encodedStr = strURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
            return URL(string: encodedStr)
        case .loadMovieDetail:
            let strURL = "\(EndPoints.moviesBaseURL)\(EndPoints.movieEndPoint)\(subEndpoint)"
            let encodedStr = strURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
            return URL(string: encodedStr)
        case .posterImage:
            let strURL = "\(EndPoints.imageBaseUrl)\(subEndpoint)"
            let encodedStr = strURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
            return URL(string: encodedStr)
        }
    }
}

