//
//  MovieDetailViewController.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//
/**View controller Used to show movie detail*/
import UIKit
class MovieDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDateValue: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblOverviewValue: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter : MoviesDetailPresenterInterface?
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.presenter?.navigationTitle
        activityIndicator.hidesWhenStopped = true
        presenter?.viewDidLoad()
    }
}

// MARK: - MovieDetailPresenterOutputDelegate
extension MovieDetailViewController: MovieDetailPresenterOutputDelegate {
    func showMovieDetail() {
        DispatchQueue.main.async {
            let movieDetailViewDataModel = self.presenter?.getMovieDetailViewDataModel()
            if let posterURL = movieDetailViewDataModel?.posterURL {
                self.imageView.setImage(url: posterURL)
            }
            self.lblMovieName.text = movieDetailViewDataModel?.title
            self.lblGenres.text = movieDetailViewDataModel?.genresText
            self.lblDateValue.text = movieDetailViewDataModel?.releaseDataText
            self.lblOverviewValue.text = movieDetailViewDataModel?.overviewText
            self.lblDate.text = NSLocalizedString("Release date", comment: "")
            self.lblOverview.text = NSLocalizedString("Overview", comment: "")
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

    func showError(errorModel: ErrorMovieDetailViewModel) {
        DispatchQueue.main.async {
            let errorAlert : UIAlertController = UIAlertController(title: errorModel.title, message: errorModel.message, preferredStyle: UIAlertController.Style.alert)
            let okAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: UIAlertAction.Style.cancel) { ACTION -> Void in
            }
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
}
