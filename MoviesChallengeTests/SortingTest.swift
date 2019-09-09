//
//  SortingTest.swift
//  MoviesChallengeTests
//
//  Created by Safa Ads on 9/9/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit
import XCTest

@testable import MoviesChallenge

class SortingTest: XCTestCase {

    func testSortingByRate() {
        let movie_1 = Movies(title: "500 days of summer", year: 2019, cast: ["John Andy"], genres: ["Comedy"], rating: 1)
        let movie_2 = Movies(title: "Eat pray love", year: 2018, cast: ["Snow Lay"], genres: ["Romance"], rating: 5)
        let movie_3 = Movies(title: "With love", year: 2010, cast: ["Zac Efron"], genres: ["Romance"], rating: 2)
        var movieList = MovieList(movies: [movie_1,movie_2,movie_3])
        movieList.movies.sortByRate()
        XCTAssertEqual(movieList.movies[0].rating ,5)
    }

}
