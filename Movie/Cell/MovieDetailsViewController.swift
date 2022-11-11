//
//  MovieDetailsViewController.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 11/11/22.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    private var movie: Movie
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    private lazy var userScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos Usuários: \(movie.voteAverage)"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.attributedText = NSAttributedString(string: movie.overview).withLineSpacing(8.0)
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 32.0
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setLayout()
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        guard let imageURL = movie.posterPath else { return }
        imagePoster.configureImage(imageURL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white
        
        view.addSubview(titleLabel)
        view.addSubview(imagePoster)
        view.addSubview(userScoreLabel)
        view.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32.0)
            make.leading.trailing.equalToSuperview()
        }
        
        userScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(imagePoster.snp.bottom).offset(32.0)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        imagePoster.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(192.0)
            make.height.equalTo(264.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(32.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(userScoreLabel.snp.bottom).offset(32.0)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
}


