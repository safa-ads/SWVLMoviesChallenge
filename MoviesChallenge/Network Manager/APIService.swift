//
//  APIService.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/8/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit
import Alamofire

class APIService {
    
    let pathConfigs = PathConfigs()
    let apiWrapper = APIWrapper()
    let encodableWrapper = EncodableWrapper()
    
    func getImagesModel(movieTitle:String, response: @escaping (MovieImages)->()) {
        if let url = URL(string: pathConfigs.flickrPath) {
            let parameters : Parameters = ["api_key": NetworkManager.API_Key, "text": movieTitle]
            apiWrapper.makeRequest(url: url, method: .get, parameters: parameters, completion: { (result) in
                if let value = self.encodableWrapper.getMovieImages(data: result) {
                    response(value)
                }
            })
        }
    }
    
    func getImage(photo:Photo,  response: @escaping (UIImage)->()) {
        let fullPath = "https://farm\(photo.farm).static.flickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        if let url = URL(string: fullPath) {
            apiWrapper.makeRequest(url: url, method: .get, parameters: [:], completion: { (result) in
                if let image = UIImage(data: result) {
                    response(image)
                }
            })
        }
    }
}
