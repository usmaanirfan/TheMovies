//
//  RequestModel.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import Foundation
struct RequestModel {
    var url : URL
    var paramters: [String: String]?
    var headers: [String: String] = NetworkConstants.RequestDefaultHeaders
    var httpMethod: Method = .get
    var body : [String : Any]?

    init(paramters: [String: String]?, url : URL) {
        self.paramters = paramters
        self.url = url
    }
}
