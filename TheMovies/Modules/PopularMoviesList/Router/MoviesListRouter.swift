//
//  MoviesListRouter.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**Router for  PopularMovieList module.  used for data passing, creating dependencies and navigation flow */
import UIKit
class MoviesListRouter : MoviesListRouterInterface {

    static func createMoviesListListModule() -> UIViewController{
        // Create layers
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MoviesNavigationController")
        if let view = navController.children.first as? PopularTopMoviesViewController {
            let networkService = NetworkService()
            let translationLayer = TranslationLayer()
            let configurationManager = ConfigurationManager()
            let router: MoviesListRouterInterface = MoviesListRouter()
            let moviesListInteractor = MoviesListInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkService)
            let moviesListPresenter = MoviesListPresenter(moviesListInteractor: moviesListInteractor)
            moviesListInteractor.moviesListInteractorOutputDelegate = moviesListPresenter
            moviesListPresenter.moviesListPresenterOutputDelegate = view
            moviesListPresenter.moviesListRouterInterface = router
            view.presenter = moviesListPresenter
            return navController
        }
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func pushMovieDetailController(from view: MoviesListPresenterOutputDelegate, movieId: Int) {
        let moviesDetailViewController = MovieDetailRouter.createMoviesListListModule(with: movieId)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(moviesDetailViewController, animated: true)
        }
    }
}

