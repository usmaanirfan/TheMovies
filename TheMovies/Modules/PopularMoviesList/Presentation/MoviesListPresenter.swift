//
//  MoviesListPresenter.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Presenter for PopularMoviesList module that communicates to interactor layer and delegates response to view*/
import Foundation
class MoviesListPresenter : MoviesListPresenterInterface {
    var moviesListInteractor : MoviesListInteractorInterface?
    weak var moviesListPresenterOutputDelegate : MoviesListPresenterOutputDelegate?
    var moviesListRouterInterface : MoviesListRouterInterface?
    fileprivate var topMovies : [Movie]?

    var navigationTitle: String {
        return NSLocalizedString("Movies", comment: "")
    }

    //MARK: Initializer
    init(moviesListInteractor : MoviesListInteractorInterface) {
        self.moviesListInteractor = moviesListInteractor
    }

    //MARK: Custom Internal methods
    func viewDidLoad() {
        self.moviesListPresenterOutputDelegate?.showLoading()
        self.moviesListInteractor?.fetchPopularMovies()
    }

    func getMoviesCount() -> Int {
        self.topMovies?.count ?? 0

    }

    func getMovieViewDataModelFor(index: Int) -> MovieViewDataModel {
        var title = ""
        var posterURL : URL?
        if let movie = self.topMovies?[index] {
            title = movie.title ?? ""
            let posterPath = movie.posterPath ?? ""
            let url = self.moviesListInteractor?.getPosterUrl(subEndpoint: posterPath)
            if let url = url {
                posterURL = url
            }
        }
        return MovieViewDataModel(title: title, posterURL: posterURL)
    }

    func didSelectFor(index: Int) {
        if let movie = self.topMovies?[index] {
            guard let movieId = movie.id else { return  }
            moviesListRouterInterface?.pushMovieDetailController(from: moviesListPresenterOutputDelegate!, movieId: movieId)
        }
    }

    //MARK: Custom fileprivate methods
    fileprivate func getToptenMovies() {
        self.topMovies = self.moviesListInteractor?.topMovies(with: 10)
    }
}

//MARK: Extension for MoviesListInteractorOutputDelegate
extension MoviesListPresenter: MoviesListInteractorOutputDelegate {
    func didFetchMovies(movies: [Movie]?) {
        self.getToptenMovies()
        self.moviesListPresenterOutputDelegate?.hideLoading()
        self.moviesListPresenterOutputDelegate?.showMovies()
    }

    func didGetErrorInMovies(_ errr: Error) {
        self.moviesListPresenterOutputDelegate?.hideLoading()
        self.moviesListPresenterOutputDelegate?.showError(errorModel : ErrorMovieViewModel(title: NSLocalizedString("Oops!", comment: ""), message: errr.localizedDescription))
    }
}
