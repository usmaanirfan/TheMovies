//
//  MovieDetailPresenter.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Presenter for MovieDetail module that communicates to interactor layer and delegates response to view*/
import Foundation
class MovieDetailPresenter : MoviesDetailPresenterInterface {

    var movieDetailInteractor: MovieDetailInteractorInterface?
    weak var movieDetailPresenterOutputDelegate : MovieDetailPresenterOutputDelegate?
    fileprivate var movieDetail : MovieDetail?
    var router : MovieDetailRouterInterface?
    var movieId : Int?
    
    var navigationTitle: String {
        return NSLocalizedString("Movie Detail", comment: "")
    }

    //MARK: Initializer
    init(movieDetailInteractor : MovieDetailInteractorInterface) {
        self.movieDetailInteractor = movieDetailInteractor
    }

    //MARK: Custom Internal methods
    func viewDidLoad() {
        self.movieDetailPresenterOutputDelegate?.showLoading()
        if let movieId = self.movieId {
            self.movieDetailInteractor?.fetchMovieDetail(movieId: movieId)
        }
    }

    func getMovieDetailViewDataModel() -> MovieDetailViewDataModel {
        var title = ""
        var posterURL : URL?
        var genresText : String = ""
        var releaseDataText = ""
        var overviewText = ""
        var langauges = ""
        if let movie = movieDetail {
            title = movie.title ?? ""
            let posterPath = movie.posterPath ?? ""
            let url = self.movieDetailInteractor?.getPosterUrl(subEndpoint: posterPath)
            if let url = url {
                posterURL = url
            }
            genresText = movie.genres?.compactMap({ $0.name}).joined(separator: ", ") ?? ""
            releaseDataText = movie.releaseDate ?? ""
            overviewText = movie.overview ?? ""
            langauges = movie.spokenLanguages?.compactMap({ $0.name}).joined(separator: ", ") ?? ""
          }
        return MovieDetailViewDataModel(title: title, posterURL: posterURL, genresText: genresText, releaseDataText: releaseDataText, overviewText: overviewText, langauges: langauges)
    }
}

//MARK: Extension : MoviesDetailInteractorOutputDelegate
extension MovieDetailPresenter: MoviesDetailInteractorOutputDelegate {
    func didFetchMovieDetail(movieDetail : MovieDetail?) {
        self.movieDetail = movieDetail
        self.movieDetailPresenterOutputDelegate?.hideLoading()
        self.movieDetailPresenterOutputDelegate?.showMovieDetail()
    }

    func didGetErrorInMovieDetail(_ errr: Error) {
        self.movieDetailPresenterOutputDelegate?.hideLoading()
        self.movieDetailPresenterOutputDelegate?.showError(errorModel : ErrorMovieDetailViewModel(title: NSLocalizedString("Oops!", comment: ""), message: errr.localizedDescription))
    }
}
