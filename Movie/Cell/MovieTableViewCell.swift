//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import Foundation
import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var releaseDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 18.0
        imgView.layer.masksToBounds = true
        imgView.backgroundColor = .red
        return imgView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleLabel, releaseDataLabel].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        [imagePoster, textStackView].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 16.0
        stack.alignment = .center
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(movie: Movie) {
        setContraints()
        titleLabel.text = movie.title
        releaseDataLabel.text = "Lançamento: \(movie.releaseDate.formatDate())"
        guard let imageURL = movie.posterPath else { return }
        imagePoster.configureImage(imageURL)
    }
    
    private func setLayout() {
        backgroundColor = .clear
    }
    
    private func setContraints() {
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.0)
            make.bottom.equalToSuperview().offset(-16.0)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        imagePoster.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(120)
        }
    }
}
