//
//  MoviesListInteractor.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//
/**Interactor for PopularMoviesList module that communicates to service layer and delegates response to presenter*/
import Foundation

class MoviesListInteractor : MoviesListInteractorInterface {
    weak var moviesListInteractorOutputDelegate : MoviesListInteractorOutputDelegate?
    var networkService : NetworkServiceInterface
    let configurationManager : ConfigurationManager
    fileprivate var translator : TranslationInterface
    var movies : [Movie]?

    //MARK: Initializer
    init(configurationManager : ConfigurationManager, translator : TranslationInterface, networkService : NetworkServiceInterface) {
        self.configurationManager = configurationManager
        self.translator = translator
        self.networkService = networkService
    }

    //MARK: Custom Internal methods
    func fetchPopularMovies() {
        let queryParameters = self.prepareQueryParameters()
        if let fetchMoviesUrl = configurationManager.buildURL(for: .loadPopularMovies) {
            let requestModel = RequestModel(paramters: queryParameters, url: fetchMoviesUrl)
            self.networkService.loadFromServer(with: requestModel, completionHandler: { result in
                switch result {
                case .success(let data):
                    self.processData(data: data)
                case .failure(let error):
                    self.moviesListInteractorOutputDelegate?.didGetErrorInMovies(error)
                }
            })
        }

    }

    func topMovies(with number : Int) -> [Movie]?{
        let sortedMovies = self.movies?.sorted(by: { $0.popularity ?? 0 > $1.popularity ?? 0 })
        if let movies = sortedMovies?.prefix(number) {
            return Array(movies)
        }
        return movies
    }

    func getPosterUrl(subEndpoint : String)->URL? {
        return configurationManager.buildURL(for: .posterImage, subEndpoint: subEndpoint)
    }

    //MARK: Private methods
    private func processData(data : Data?) {
        if let data = data {
            if let movies = self.translator.createMoviesFromJsonData(data) {
                self.movies = movies
                self.moviesListInteractorOutputDelegate?.didFetchMovies(movies: self.movies)
            } else {
                let error = RequestError.parse
                self.moviesListInteractorOutputDelegate?.didGetErrorInMovies(error)
            }
        } else {
            let error = RequestError.noData
            self.moviesListInteractorOutputDelegate?.didGetErrorInMovies(error)
        }
    }

    private func prepareQueryParameters() -> [String : String]{
        var parameters = [String: String]()
        parameters["api_key"] = EndPoints.apiKey
        return parameters
    }

}

