//
//  PolpularTopMovies+Collection.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//

import UIKit

//MARK: - UICollectionViewDataSource
extension PopularTopMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.getMoviesCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.CellIdentifiers.MovieCellReuseIdentifier, for: indexPath)
        guard let movieCell = cell as? MovieCell, let viewModel = self.presenter?.getMovieViewDataModelFor(index: indexPath.row) else { return cell }
        movieCell.configureCell(viewModel: viewModel)
        return movieCell
    }
}



//MARK: - UICollectionViewDelegate
extension PopularTopMoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.didSelectFor(index: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PopularTopMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let width = UIScreen.main.bounds.size.width/2.5 - CGFloat(AppConstants.CollectionView.kTRCollectionLeftRightMargin*2.0)
            return CGSize(width: width, height: (self.view.frame.width/2)*0.9)
        } else {
            let width = UIScreen.main.bounds.size.width - CGFloat(AppConstants.CollectionView.kTRCollectionLeftRightMargin*2.0)
            return CGSize(width: width, height: UIScreen.main.bounds.size.width)
        }
    }

    // 3
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return sectionInsets
    }

    // 4
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left
    }

}
