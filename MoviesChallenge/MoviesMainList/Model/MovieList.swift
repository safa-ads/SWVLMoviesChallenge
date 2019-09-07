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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decode([Movies].self, forKey: .movies)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(movies, forKey: .movies)
    }
    
    enum CodingKeys: String, CodingKey {
        case movies
    }
}

struct Movies: Codable {
    let title:String
    let year:Int
    let cast:[String]?
    let genres:[String]?
    let rating:Int?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        year = try values.decode(Int.self, forKey: .year)
        cast = try values.decodeIfPresent([String].self, forKey: .cast)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(year, forKey: .year)
        try container.encodeIfPresent(cast, forKey: .cast)
        try container.encodeIfPresent(genres, forKey: .genres)
        try container.encodeIfPresent(rating, forKey: .rating)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case year
        case cast
        case genres
        case rating
    }
}


