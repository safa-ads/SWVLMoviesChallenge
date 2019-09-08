//
//  MovieDetailsViewController.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/7/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var collectionviewHeightConstraint: NSLayoutConstraint!
    
    let viewModel:MovieDetailsViewModel = MovieDetailsViewModel()
    let padding:CGFloat = 20
    let height:CGFloat = 200
    var movie: Movies?
    var movieImages:[UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setCollectionViewDelegates()
        getMovieImages()
        setCollectionViewHeight()
    }
    
    func bindData() {
        if let movieDetails = movie {
            titleLabel.text = movieDetails.title
            genreLabel.text = movieDetails.genres?.joined(separator: ", ")
            castLabel.text = movieDetails.cast?.joined(separator: ", ")
        }
    }
    
    func setCollectionViewDelegates() {
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    func getMovieImages() {
        if let movieDetails = movie {
            viewModel.getMovieImages(movieTitle: movieDetails.title) { (images) in
                self.movieImages = images
                self.collectionview.reloadData()
            }
        }
    }
    
    func setCollectionViewHeight() {
        if movieImages?.count == 0 {
            collectionviewHeightConstraint.constant = 0
        }
    }
}

extension MovieDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = movieImages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCollectionViewCell.cellIdentifier, for: indexPath) as! MovieDetailsCollectionViewCell
        cell.movieImageView.image = movieImages?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.bounds.width)/2 - padding, height: height)
    }
}
