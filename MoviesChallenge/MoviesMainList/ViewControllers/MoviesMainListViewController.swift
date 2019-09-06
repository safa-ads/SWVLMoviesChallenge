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
    
    let moviesMainListTableviewCellNibFileName = "MoviesMainListTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchViewDelegate()
        setTableViewDelegates()
    }
    
    func setSearchViewDelegate() {
        searchView.delegate = self
    }
    
    func setTableViewDelegates() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.register(UINib(nibName: moviesMainListTableviewCellNibFileName, bundle: nil), forCellReuseIdentifier: MoviesMainListTableViewCell.cellIdentifier)
    }
}

extension MoviesMainListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier:MoviesMainListTableViewCell.cellIdentifier, for: indexPath) as! MoviesMainListTableViewCell
        cell.titleLabel.text = "La Casa De Papel"
        cell.setRating(rating: 5)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
}
extension MoviesMainListViewController : SearchDelegate {
    func search(text: String) {
        
    }
}
