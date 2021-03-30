//
//  PopularTopMoviesViewControllerSuite.swift
//  TheMoviesTests
//
//  Created by Usman Ansari on 30/03/21.
//

import XCTest

@testable import TheMovies

class PopularTopMoviesViewControllerSuite: XCTestCase {
    var popularTopMoviesViewController: PopularTopMoviesViewController!
    override func setUp() {
        self.popularTopMoviesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopularTopMoviesViewController") as? PopularTopMoviesViewController
        let networkService = NetworkServiceMock()
        let translationLayer = TranslationLayer()
        let configurationManager = ConfigurationManager()
        let router: MoviesListRouterInterface = MoviesListRouter()
        let moviesListInteractor = MoviesListInteractor(configurationManager: configurationManager, translator: translationLayer, networkService: networkService)
        let moviesListPresenter = MoviesListPresenter(moviesListInteractor: moviesListInteractor)
        moviesListInteractor.moviesListInteractorOutputDelegate = moviesListPresenter
        moviesListPresenter.moviesListPresenterOutputDelegate = self.popularTopMoviesViewController
        moviesListPresenter.moviesListRouterInterface = router
        self.popularTopMoviesViewController.presenter = moviesListPresenter
        _ = self.popularTopMoviesViewController.view

    }

    // MARK: Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(self.popularTopMoviesViewController.collectionView)
    }

    func testCollectionDataSourceViewDataSource(){
        XCTAssertNotNil(self.popularTopMoviesViewController.collectionView.dataSource)
    }

    func testCollectionDataSourceViewDelegate() {
        XCTAssertNotNil(self.popularTopMoviesViewController.collectionView.delegate)
    }


    // MARK: Number of items Checks
    func testViewNumberOfSections() {
        XCTAssertEqual(self.popularTopMoviesViewController.collectionView.numberOfSections, 1)
    }

    func testViewNumberOfItems() {
        XCTAssertEqual(self.popularTopMoviesViewController.collectionView.numberOfItems(inSection: 0), 10)
    }
    //Navigation Title
    func testCellNavigationTitle() {
        XCTAssertEqual(self.popularTopMoviesViewController.presenter?.navigationTitle, "Movies")
    }

}
