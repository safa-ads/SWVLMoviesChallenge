//
//  MovieList.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

struct MovieList: Codable {
    var movies:[Movies]
    
    init(movies:[Movies]) {
        self.movies = movies
    }
}

struct Movies: Codable {
    let title:String
    let year:Int
    let cast:[String]?
    let genres:[String]?
    let rating:Int?
}


