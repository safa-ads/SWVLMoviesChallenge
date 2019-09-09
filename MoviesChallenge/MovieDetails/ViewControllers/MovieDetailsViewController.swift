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
    let padding:CGFloat = 10
    let height:CGFloat = 100
    var movie: Movies?
    var movieImages:[UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        setCollectionViewDelegates()
        getMovieImages()
    }
    
    //// MARK: Data Binding
    func bindData() {
        if let movieDetails = movie {
            titleLabel.text = movieDetails.title
            if let genres = movieDetails.genres {
                genreLabel.text = genres.joined(separator: ", ")
            }
            else {
                genreLabel.text = "No genre specified"
            }
            
            if let cast =  movieDetails.cast {
                castLabel.text = "Cast: " + cast.joined(separator: ", ")
            }
            else {
                castLabel.text = "No cast provided"
            }
        }
    }
    
    // MARK: Delegates
    func setCollectionViewDelegates() {
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    // MARK: set data
    func getMovieImages() {
        if let movieDetails = movie {
            viewModel.getMovieImages(movieTitle: movieDetails.title) { (images) in
                self.movieImages = images
                self.setCollectionViewHeight()
                self.collectionview.reloadData()
            }
        }
    }
    
    //Collection view height set to zero to hide collection view in case no images returned from flickr
    func setCollectionViewHeight() {
        if movieImages?.count == 0 {
            self.collectionviewHeightConstraint.constant = 0
        }
    }
}

// MARK: Collection view

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
