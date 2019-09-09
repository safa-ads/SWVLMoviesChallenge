//
//  MoviesChallengeTests.swift
//  MoviesChallengeTests
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import XCTest
@testable import MoviesChallenge

class AlamofireTest: XCTestCase {
    
    //Working APIs
    func testAPIRequest() {
        let apiWrapper = APIWrapper()
        apiWrapper.makeRequest(url: URL(string: "https://farm66.static.flickr.com/65535/48701472192_b9aa9673bf.jpg")!, method: .get, parameters: [:]) { (data) in
            XCTAssertTrue (data.count > 0)
        }
    }
    
}
