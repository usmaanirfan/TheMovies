//
//  NetworkService.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
import Alamofire

class NetworkService : NetworkServiceInterface{
    typealias APIResult = (Result<Data?, Error>) -> Void
    func loadFromServer(with requestModel : RequestModel, completionHandler : @escaping APIResult) {
        let afHttpMethod : HTTPMethod = HTTPMethod(rawValue: requestModel.httpMethod.rawValue)
        let afHeaders : HTTPHeaders = HTTPHeaders(requestModel.headers)
        AF.request(requestModel.url, method:afHttpMethod ,parameters: requestModel.paramters, headers: afHeaders).response { response in
            self.processResponse(response.response, data: response.data, error: response.error) { result in
                switch result {
                 case .success(let data):
                    completionHandler(.success(data))
                 case .failure(let error):
                    completionHandler(.failure(error))
                }
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
