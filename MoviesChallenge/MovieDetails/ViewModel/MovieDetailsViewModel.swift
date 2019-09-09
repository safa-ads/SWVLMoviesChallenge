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
    
    //This function gets Image model then gets image in jpg format one by one from the model
    
    func getMovieImages(movieTitle:String,completion: @escaping ([UIImage])->())  {
        self.apiService.getImagesModel(movieTitle: movieTitle) { (moviePhotos) in
            if (moviePhotos.photos.photo.count == 0) {
                completion(self.movieImages)
            }
            else {
                for photo in moviePhotos.photos.photo {
                    self.apiService.getImage(photo: photo, response: { (image) in
                        self.movieImages.append(image)
                        completion(self.movieImages)
                    })
                }
            }
            
        }
    }
}
