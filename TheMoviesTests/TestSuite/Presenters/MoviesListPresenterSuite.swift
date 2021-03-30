//
//  MoviesListPresenterSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 29/03/21.
//

import XCTest
@testable import TheMovies

class MoviesListPresenterSuite: XCTestCase {
    var moviesListPresenter : MoviesListPresenter?

    override func setUp() {
        let networkServiceMock = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        let moviesListInteractor = MoviesListInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkServiceMock)
        moviesListPresenter = MoviesListPresenter(moviesListInteractor: moviesListInteractor)
        moviesListInteractor.moviesListInteractorOutputDelegate = moviesListPresenter
        moviesListPresenter?.viewDidLoad()
    }

    override func tearDown() {

    }

    func testViewDidLoad() {
        //Given
        let totalCount = 10

        //When
        let count = moviesListPresenter?.getMoviesCount()

        //Then
        XCTAssertEqual(count, totalCount, "Error in response data")

    }

    func testGetMovieViewDataModel() {
        //Given
        let givenMovieViewDataModel = MovieViewDataModel(title: "Zack Snyder's Justice League", posterURL: URL(string: "https://image.tmdb.org/t/p/w500/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg"))

        //When
        let returnedMovieViewDataModel = moviesListPresenter?.getMovieViewDataModelFor(index: 0)

        XCTAssertEqual(givenMovieViewDataModel.title, returnedMovieViewDataModel?.title)
        XCTAssertEqual(givenMovieViewDataModel.posterURL?.absoluteString, returnedMovieViewDataModel?.posterURL?.absoluteString)
    }

    func testNavigationTitle() {
        //Given
        let navigationTitle = NSLocalizedString("Movies", comment: "")

        //When
        let returnedNavigationTitle = moviesListPresenter?.navigationTitle

        XCTAssertEqual(navigationTitle, returnedNavigationTitle)
    }

}
