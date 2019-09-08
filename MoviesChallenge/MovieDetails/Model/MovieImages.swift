//
//  MovieImage.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/8/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

struct MovieImages: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}

