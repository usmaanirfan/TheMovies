//
//  NetworkUtility.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation

enum Method: String {
    case get = "GET", post = "POST", put = "PUT", delete = "DELETE"
}

enum RequestError: Error {
    case invalidURL, noHTTPResponse, http(status: Int), generic, parse, noData

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .noHTTPResponse:
            return "Not a HTTP response."
        case .http(let status):
            return "HTTP error: \(status)."
        case .generic:
            return "Sonmething went wrong!"
        case .parse:
            return "Data format is wrong"
        case .noData:
            return "Data not avaiilable"
        }
    }
}

struct NetworkConstants {
    static var successCodes: CountableRange<Int>  = 200..<299
    static var failureCodes: CountableRange<Int> = 400..<499
    static let RequestDefaultHeaders = ["Content-type": "application/json; charset=utf-8"]
}
