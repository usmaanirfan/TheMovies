//
//  MoviesDetailRouter.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Router for MovieDetail module.  used for data passing, creating dependencies and navigation flow */
import UIKit
class MovieDetailRouter : MovieDetailRouterInterface {

    static func createMoviesListListModule(with movieId : Int) -> UIViewController{
        // Create layers
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailViewController")
        if let view = viewController as? MovieDetailViewController {
            let router = MovieDetailRouter()
            let networkService = NetworkService()
            let translationLayer = TranslationLayer()
            let configurationManager = ConfigurationManager()
            let movieDetailInteractor = MovieDetailInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkService)
            let movieDetailPresenter = MovieDetailPresenter(movieDetailInteractor: movieDetailInteractor)
            movieDetailInteractor.moviesDetailInteractorOutputDelegate = movieDetailPresenter
            movieDetailPresenter.movieId = movieId
            movieDetailPresenter.router = router
            movieDetailPresenter.movieDetailPresenterOutputDelegate = view
            view.presenter = movieDetailPresenter
            return viewController
        }
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}

