//
//  ViewController.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class MoviesMainListViewController: UIViewController {
    
    @IBOutlet weak var searchView: SearchView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var noResultView: NoResultView!
    
    let moviesMainListTableviewCellNibFileName = "MoviesMainListTableViewCell"
    let viewModel:MoviesMainListViewModel = MoviesMainListViewModel()
    
    var movieList:MovieList?
    var moviesDic: [Int : [Movies]] = [:]
    var  sortedMoviesDicKeys:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchViewDelegate()
        setTableViewDelegates()
        setMoviesList()
    }
    
    func setSearchViewDelegate() {
        searchView.delegate = self
    }
    
    func setTableViewDelegates() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.register(UINib(nibName: moviesMainListTableviewCellNibFileName, bundle: nil), forCellReuseIdentifier: MoviesMainListTableViewCell.cellIdentifier)
    }
    
    func setMoviesList() {
        movieList = viewModel.getMovieList()
        tableview.reloadData()
    }
}

extension MoviesMainListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!moviesDic.isEmpty) {
            if let count = moviesDic[sortedMoviesDicKeys[section]]?.count {
                return count
            }
        }
        else {
            if let count = movieList?.movies.count {
                return count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var title = ""
        var rating = 0
        if (!moviesDic.isEmpty) {
            let movie = moviesDic[sortedMoviesDicKeys[indexPath.section]]?[indexPath.row]
            if let movieTitle = movie?.title, let movieRating = movie?.rating {
                title = movieTitle
                rating = movieRating
            }
        }
        else {
            if let movieTitle = movieList?.movies[indexPath.row].title, let movieRating = movieList?.movies[indexPath.row].rating {
                title = movieTitle
                rating = movieRating
            }
        }
        let cell = self.tableview.dequeueReusableCell(withIdentifier:MoviesMainListTableViewCell.cellIdentifier, for: indexPath) as! MoviesMainListTableViewCell
        cell.titleLabel.text = title
        cell.setRating(rating:rating)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "MovieDetails", bundle: nil).instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
        if (!moviesDic.isEmpty) {
            vc.movie = moviesDic[sortedMoviesDicKeys[indexPath.section]]?[indexPath.row]
        }
        else {
            vc.movie = movieList?.movies[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (!moviesDic.isEmpty) {
            return moviesDic.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(!moviesDic.isEmpty) {
            let key = sortedMoviesDicKeys[section]
            return "\(key)"
        }
        else {
            return "All movies"
        }
        
    }
    
}

extension MoviesMainListViewController : SearchDelegate {
    
    func search(text: String) {
        moviesDic = viewModel.sortAndCategorizeMovies(text:text)
        sortedMoviesDicKeys = viewModel.sortDictionaryKeys(moviesDictionary: moviesDic)
        if(viewModel.isSearchFound()) {
            noResultView.isHidden = true
            tableview.reloadData()
        }
        else {
          noResultView.isHidden = false
        }
    }
    
    func clear() {
        noResultView.isHidden = true
        moviesDic = viewModel.clear()
        tableview.reloadData()
    }
}

