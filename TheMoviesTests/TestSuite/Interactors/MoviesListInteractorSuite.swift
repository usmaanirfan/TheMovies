//
//  MoviesListInteractorSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 29/03/21.
//

import XCTest
@testable import TheMovies

class MoviesListInteractorSuite: XCTestCase {
    var moviesListInteractor : MoviesListInteractor?

    override func setUp() {
        let networkServiceMock = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        moviesListInteractor = MoviesListInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkServiceMock)
    }

    override func tearDown() {

    }

    func testFetchPopularMoviesCount() {
        //Given
        let totalCount = 20

        //When
        moviesListInteractor?.fetchPopularMovies()

        //Then
        XCTAssertEqual(moviesListInteractor?.movies?.count, totalCount, "Error in response data")

    }

    func testFetchPopularMovieType() {
        //When
        moviesListInteractor?.fetchPopularMovies()

        //Then
        XCTAssertTrue((moviesListInteractor?.movies![0]) != nil)
    }

    func testTopMovies() {
        //Given
        let totalCount = 10

        //When
        moviesListInteractor?.fetchPopularMovies()
        let movies = moviesListInteractor?.topMovies(with: 10)

        //Then
        XCTAssertEqual(movies?.count, totalCount, "Error in topMovies")
    }

    func testGetPosterUrl() {
        //Given
        let givenPosterUrl = "https://image.tmdb.org/t/p/w500/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg"

        //When
        let returnedPosterURL  = moviesListInteractor?.getPosterUrl(subEndpoint: "/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg")?.absoluteString

        //Then
        XCTAssertEqual(givenPosterUrl, returnedPosterURL, "Error in getPosterUrl")
    }

}
