//
//  MovieDetailViewControllerSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 30/03/21.
//

import XCTest

@testable import TheMovies

class MovieDetailViewControllerSuite: XCTestCase {
    var movieDetailViewController: MovieDetailViewController!
    override func setUp() {
        self.movieDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        let router = MovieDetailRouter()
        let networkService = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        let movieDetailInteractor = MovieDetailInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkService)
        let movieDetailPresenter = MovieDetailPresenter(movieDetailInteractor: movieDetailInteractor)
        movieDetailInteractor.moviesDetailInteractorOutputDelegate = movieDetailPresenter
        movieDetailPresenter.movieId = 791373
        movieDetailPresenter.router = router
        movieDetailPresenter.movieDetailPresenterOutputDelegate = self.movieDetailViewController
        self.movieDetailViewController.presenter = movieDetailPresenter
        _ = self.movieDetailViewController.view

    }

    // MARK: Nil Checks
    func testLibraryVC_lblMovieNameShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblMovieName)
    }

    func testLibraryVC_lblGenreShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblGenres)
    }

    func testLibraryVC_lblReleaseDateShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblDate)
    }

    func testLibraryVC_lblReleaseDateValueShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblDateValue)
    }

    func testLibraryVC_lblOverviewShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblOverview)
    }

    func testLibraryVC_lblOverviewValueShouldNotBeNil() {
        XCTAssertNotNil(self.movieDetailViewController.lblOverviewValue)
    }

    // MARK:Navigation Title
    func testCellNavigationTitle() {
        XCTAssertEqual(self.movieDetailViewController.presenter?.navigationTitle, "Movie Detail")
    }

}
