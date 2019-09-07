//
//  FileReader.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class FileReader {
    
    func readJSONFile(moviesFileName:String, moviesFileExtension:String) -> Data {
        if let path = Bundle.main.path(forResource: moviesFileName, ofType: moviesFileExtension) {
            do {
                if let data =  try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                    return data
                }
            }
        }
        ErrorView.getSharedInstance().show()
        return Data()
    }
}
