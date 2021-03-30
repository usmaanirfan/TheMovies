//
//  TopMoviesViewController.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**View controller Used to show collection of top ten poster images*/
import UIKit

class PopularTopMoviesViewController: UIViewController {
    var presenter : MoviesListPresenterInterface?
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidesWhenStopped = true
        self.navigationItem.title = self.presenter?.navigationTitle
        presenter?.viewDidLoad()
    }
}

// MARK: - Extension MoviesListPresenterOutputDelegate
extension PopularTopMoviesViewController: MoviesListPresenterOutputDelegate {
    func showMovies() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func showError(errorModel: ErrorMovieViewModel) {
        DispatchQueue.main.async {
            let errorAlert : UIAlertController = UIAlertController(title: errorModel.title, message: errorModel.message, preferredStyle: UIAlertController.Style.alert)
            let okAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: UIAlertAction.Style.cancel) { ACTION -> Void in
            }
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }

    func showLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }

    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

}
