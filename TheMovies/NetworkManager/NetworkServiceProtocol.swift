//
//  NetworkServiceProtocol.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
protocol NetworkServiceInterface {
    typealias APIResult = (Result<Data?, Error>) -> Void
    func loadFromServer(with requestModel : RequestModel, completionHandler : @escaping APIResult)
}

