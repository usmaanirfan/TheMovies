//
//  MovieCell.swift
//  TheMovies
//
//  Created by Usman Ansari on 29/03/21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        super.awakeFromNib()
    }

    func configureCell(viewModel : MovieViewDataModel) {
        if let posterURL = viewModel.posterURL {
            self.imageView?.setImage(url: posterURL)
        }
    }
    
}
