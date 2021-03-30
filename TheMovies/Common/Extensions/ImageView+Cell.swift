//
//  ImageView+Cell.swift
//  TheMovies
//
//  Created by Usman Ansari on 28/03/21.
//

import UIKit
import Kingfisher
extension UIImageView {
    func setImage(url : URL) {
        self.kf.setImage(with: url, placeholder: UIImage(systemName: AppConstants.Assets.placeholderImage))
    }
}
