//
//  MovieDetailInteractor.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Interactor for MovieDetail module that communicates to service layer and delegates response to presenter*/
import Foundation
class MovieDetailInteractor : MovieDetailInteractorInterface {
    weak var moviesDetailInteractorOutputDelegate : MoviesDetailInteractorOutputDelegate?
    var networkService : NetworkServiceInterface
    let configurationManager : ConfigurationManager
    fileprivate var translator : TranslationInterface
    var movieDetail : MovieDetail?

    //MARK: Initializer
    init(configurationManager : ConfigurationManager, translator : TranslationInterface, networkService : NetworkServiceInterface) {
        self.configurationManager = configurationManager
        self.translator = translator
        self.networkService = networkService
    }

    //MARK: Custom Internal methods
    func fetchMovieDetail(movieId : Int) {
        let queryParameters = self.prepareQueryParameters()
        let movieIdStr = "/"+"\(movieId)"
        if let fetchMovieUrl = configurationManager.buildURL(for: .loadMovieDetail, subEndpoint: movieIdStr) {
            let requestModel = RequestModel(paramters: queryParameters, url: fetchMovieUrl)
            self.networkService.loadFromServer(with: requestModel, completionHandler: { result in
                switch result {
                case .success(let data):
                    self.processData(data: data)
                case .failure(let error):
                    self.moviesDetailInteractorOutputDelegate?.didGetErrorInMovieDetail(error)
                }
            })
        }

    }

    func getPosterUrl(subEndpoint : String)->URL? {
        return configurationManager.buildURL(for: .posterImage, subEndpoint: subEndpoint)
    }

    //MARK: Private methods
    private func processData(data : Data?) {
        if let data = data {
            if let movieDetail = self.translator.createMovieDetailFromJsonData(data) {
                self.movieDetail = movieDetail
                self.moviesDetailInteractorOutputDelegate?.didFetchMovieDetail(movieDetail: self.movieDetail)
            } else {
                let error = RequestError.parse
                self.moviesDetailInteractorOutputDelegate?.didGetErrorInMovieDetail(error)
            }
        } else {
            let error = RequestError.noData
            self.moviesDetailInteractorOutputDelegate?.didGetErrorInMovieDetail(error)
        }
    }

    private func prepareQueryParameters() -> [String : String]{
        var parameters = [String: String]()
        parameters["api_key"] = EndPoints.apiKey
        return parameters
    }

}
