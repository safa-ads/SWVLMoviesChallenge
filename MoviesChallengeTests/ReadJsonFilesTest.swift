//
//  ReadJsonFilesTest.swift
//  MoviesChallengeTests
//
//  Created by Safa Ads on 9/9/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit
import XCTest

@testable import MoviesChallenge

class ReadJsonFilesTest: XCTestCase {
    
    func testReadingJSONFile() {
        let fileReader = FileReader()
        let data = fileReader.readJSONFile(moviesFileName: "movies", moviesFileExtension: "json")
         XCTAssertTrue(data.count > 0)
    }
}
