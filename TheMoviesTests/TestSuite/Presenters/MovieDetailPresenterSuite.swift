//
//  MovieDetailPresenterSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 29/03/21.
//

import Foundation
import XCTest
@testable import TheMovies

class MovieDetailPresenterSuite: XCTestCase {
    var movieDetailPresenter : MovieDetailPresenter?

    override func setUp() {
        let networkServiceMock = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        let movieDetailInteractor = MovieDetailInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkServiceMock)
        movieDetailPresenter = MovieDetailPresenter(movieDetailInteractor: movieDetailInteractor)
        movieDetailPresenter?.movieId = 791373
        movieDetailInteractor.moviesDetailInteractorOutputDelegate = movieDetailPresenter
        movieDetailPresenter?.viewDidLoad()
    }

    override func tearDown() {

    }

    func testGetMovieDetailViewDataModelTitle() {
        //Given
        let givenTitle = "Zack Snyder's Justice League"

        //When
        let viewModel = movieDetailPresenter?.getMovieDetailViewDataModel()

        //Then
        XCTAssertEqual(viewModel?.title, givenTitle, "Movie title is wrong")

    }

    func testGetMovieDetailViewDataModelPosterUrl() {
        //Given
        let posterURL = "https://image.tmdb.org/t/p/w500/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg"

        //When
        let viewModel = movieDetailPresenter?.getMovieDetailViewDataModel()

        //Then
        XCTAssertEqual(viewModel?.posterURL?.absoluteString, posterURL, "Movie Poster url is wrong")

    }

    func testGetMovieDetailViewDataModelGenresText() {
        //Given
        let genresText = "Action, Adventure, Fantasy, Science Fiction"

        //When
        let viewModel = movieDetailPresenter?.getMovieDetailViewDataModel()

        //Then
        XCTAssertEqual(viewModel?.genresText, genresText, "Movie Genres Text is wrong")

    }

    func testGetMovieDetailViewDataModelLangauges() {
        //Given
        let languageText = "English"

        //When
        let viewModel = movieDetailPresenter?.getMovieDetailViewDataModel()

        //Then
        XCTAssertEqual(viewModel?.langauges, languageText, "Movie languageText Text is wrong")

    }

    func testGetMovieDetailViewDataModelOverview() {
        //Given
        let ovetviewText = "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions."

        //When
        let viewModel = movieDetailPresenter?.getMovieDetailViewDataModel()

        //Then
        XCTAssertEqual(viewModel?.overviewText, ovetviewText, "Movie ovetviewText  is wrong")

    }

    func testNavigationTitle() {
        //Given
        let navigationTitle = "Movie Detail"

        //When
        let returnedNavigationTitle = movieDetailPresenter?.navigationTitle

        XCTAssertEqual(navigationTitle, returnedNavigationTitle)
    }

}
