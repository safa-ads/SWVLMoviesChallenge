//
//  MoviesMainListViewModel.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class MoviesMainListViewModel: NSObject {

    let fileName = "movies"
    let fileExtension = "json"
    var fileReader = FileReader()
    var encodableWrapper = EncodableWrapper()
    
    func getMovieList() -> MovieList? {
        let data = fileReader.readJSONFile(moviesFileName: fileName, moviesFileExtension: fileExtension)
        if let list = encodableWrapper.getMoviesList(data: data) {
            return list
        }
        return nil
    }
}
