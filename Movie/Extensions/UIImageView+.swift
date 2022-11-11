//
//  UIImageView+.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import Foundation
import Kingfisher

extension UIImageView {
    func configureImage(_ imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        self.kf.setImage(with: url)
    }
}
