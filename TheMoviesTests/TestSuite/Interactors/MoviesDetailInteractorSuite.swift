//
//  MoviesDetailInteractorSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 29/03/21.
//

import XCTest
@testable import TheMovies
class MoviesDetailInteractorSuite: XCTestCase {
    var movieDetailInteractor : MovieDetailInteractor?

    override func setUp() {
        let networkServiceMock = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        movieDetailInteractor = MovieDetailInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkServiceMock)
    }

    override func tearDown() {

    }
    

    func testFetchMovieDetail() {
        //When
        movieDetailInteractor?.fetchMovieDetail(movieId: 791373)

        //Then
        XCTAssertNotNil(movieDetailInteractor?.movieDetail, "Error in fetching movie detail")

    }

    func testFetchMovieTitle() {
        //When
        movieDetailInteractor?.fetchMovieDetail(movieId: 791373)

        //Then
        XCTAssertEqual(movieDetailInteractor?.movieDetail?.title, "Zack Snyder\'s Justice League", "Movie title is not correct")

    }

    func testMovieGenereCount() {
        //When
        movieDetailInteractor?.fetchMovieDetail(movieId: 791373)

        let generes = movieDetailInteractor?.movieDetail?.genres

        //Then
        XCTAssertEqual(generes?.count, 4, "Movie generes count is wrong")

    }

}
