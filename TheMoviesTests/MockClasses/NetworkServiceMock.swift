//
//  NetworkServiceMock.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 29/03/21.
//

import Foundation
@testable import TheMovies
class NetworkServiceMock : NetworkServiceInterface{
    typealias APIResult = (Result<Data?, Error>) -> Void
    func loadFromServer(with requestModel : RequestModel, completionHandler : @escaping APIResult) {
        var filePath : String?
        if requestModel.url.absoluteString.contains(EndPoints.popularMoviesEndpoint) == true {
            if let path = Bundle.main.path(forResource: "PopularMovies", ofType: "json") {
                filePath = path
            }
        } else if requestModel.url.absoluteString.contains(EndPoints.movieEndPoint) == true {
            if let path = Bundle.main.path(forResource: "MovieDetail", ofType: "json") {
                filePath = path
            }
        }
        if let path = filePath {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = HTTPURLResponse(url: requestModel.url, statusCode: 200,
                                               httpVersion: nil, headerFields: nil)!
                self.processResponse(response, data: data, error: nil) { result in
                    switch result {
                    case .success(let data):
                        completionHandler(.success(data))
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
            }
            catch let error {
                completionHandler(.failure(error))
            }
        }
    }

    private func processResponse(_ response: URLResponse?, data: Data?, error: Error?, completionHandler: (Result<Data?, Error>) -> Void) {
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            completionHandler(.failure(RequestError.noHTTPResponse))
            return
        }
        let statusCode = httpResponse.statusCode
        if NetworkConstants.successCodes.contains(statusCode) {
            completionHandler(.success(data))
        } else if NetworkConstants.failureCodes.contains(statusCode) {
            completionHandler(.failure(RequestError.http(status: statusCode)))
        } else {
            // Server returned response with status code different than expected `successCodes`.
            completionHandler(.failure(RequestError.generic))
        }
    }
}
