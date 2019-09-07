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
    let topCount = 5
    
    var movieList:MovieList?
    var searchedMovieList = MovieList(movies: [])
    var moviesDic: [Int : [Movies]] = [:]
    
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
            let arr = Array(moviesDic.keys)
            if let count = moviesDic[arr[section]]?.count {
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
            let key = Array(moviesDic.keys)[indexPath.section]
            let movies = moviesDic[key]
            title = (movies?[indexPath.row].title)!
            rating = (movies?[indexPath.row].rating)!
        }
        else {
            title = (movieList?.movies[indexPath.row].title)!
            rating = (movieList?.movies[indexPath.row].rating)!
        }
        
        let cell = self.tableview.dequeueReusableCell(withIdentifier:MoviesMainListTableViewCell.cellIdentifier, for: indexPath) as! MoviesMainListTableViewCell
        cell.titleLabel.text = title
        cell.setRating(rating:rating )
        
        return cell
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
            let key = Array(moviesDic.keys)[section]
            return "\(key)"
        }
        else {
            return "All movies"
        }
        
    }
    
}
extension MoviesMainListViewController : SearchDelegate {
    
    func search(text: String) {
        if let movies = movieList?.movies {
            searchedMovieList.movies.append(contentsOf: movies.filter{$0.title.lowercased().contains(text.lowercased())})
        }
        if (searchedMovieList.movies.isEmpty) {
            noResultView.isHidden = false
        }
        else {
            noResultView.isHidden = true
            sortList()
            categorizeByYear()
        }
    }
    
    func clear() {
        noResultView.isHidden = true
        searchedMovieList.movies = []
        moviesDic = [:]
        tableview.reloadData()
    }
    
    func sortList() {
        searchedMovieList.movies.sortByRate()
    }
    
    func categorizeByYear() {
        for movie in searchedMovieList.movies {
            if moviesDic[movie.year] == nil {
                moviesDic[movie.year] = [movie]
            }
            else if (moviesDic[movie.year]?.count ?? 0) < topCount  {
                moviesDic[movie.year]?.append(movie)
            }
        }
        tableview.reloadData()
    }
}

