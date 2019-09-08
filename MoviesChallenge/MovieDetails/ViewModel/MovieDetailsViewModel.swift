//
//  MovieDetailsViewModel.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/8/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class MovieDetailsViewModel {
    
    let apiService = APIService()
    
    var movieImages: [UIImage] = []
    
    func getMovieImages(movieTitle:String,completion: @escaping ([UIImage])->())  {
        self.apiService.getImagesModel(movieTitle: movieTitle) { (MoviePhotos) in
            for photo in MoviePhotos.photos.photo {
                self.apiService.getImage(photo: photo, response: { (image) in
                    self.movieImages.append(image)
                    completion(self.movieImages)
                })
            }
        }
    }
}
