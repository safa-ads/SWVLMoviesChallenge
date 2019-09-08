//
//  EncodableWrapper.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class EncodableWrapper {
    
    let decoder = JSONDecoder()
    
    func getMoviesList(data:Data) -> MovieList? {
        if let movieList =  try? decoder.decode(MovieList.self, from: data) {
            return movieList
        }
        return nil
    }
    
    func getMovieImages(data:Data) -> MovieImages? {
        if let movieImages =  try? decoder.decode(MovieImages.self, from: data) {
            return movieImages
        }
        return nil
    }
}
