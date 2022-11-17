//
//  ViewController.swift
//  Movie
//
//  Created by Jaqueline Hillesheim on 10/11/22.
//

import UIKit
import SnapKit
import SDWebImage


class MovieViewController: UIViewController {
    
    private var requstNetwoeking = Network()
    private var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filmes Populares"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setupView()
        getPopularMovies()
    }
    
    private func getPopularMovies() {
        requstNetwoeking.fetchPopularMovies { movies in
            self.movies = movies
        }
    }
}

private extension MovieViewController {
    func setupView() {
        navigationItem.backButtonTitle = "Voltar"
        view.addSubview(tituloLabel)
        view.addSubview(tableView)
        setupContraint()
    }
    
    func setupContraint() {
        
        tituloLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tituloLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell {
            cell.selectionStyle = .none
            cell.configureCell(movie: movies[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = MovieDetailsViewController(movie: movies[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
