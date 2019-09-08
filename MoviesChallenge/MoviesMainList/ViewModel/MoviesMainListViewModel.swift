//
//  MoviesMainListViewModel.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

class MoviesMainListViewModel  {
    
    let fileName = "movies"
    let fileExtension = "json"
    let topCount = 5
    
    var fileReader = FileReader()
    var encodableWrapper = EncodableWrapper()
    var movieList:MovieList?
    var searchedMovieList = MovieList(movies: [])
    var moviesDic: [Int : [Movies]] = [:]
    
    func getMovieList() -> MovieList? {
        let data = fileReader.readJSONFile(moviesFileName: fileName, moviesFileExtension: fileExtension)
        if let list = encodableWrapper.getMoviesList(data: data) {
            movieList = list
            return list
        }
        return nil
    }
    
    func isSearchFound() -> Bool {
        if (searchedMovieList.movies.isEmpty) {
            return false
        }
        else {
            return true
        }
    }
    
    func sortAndCategorizeMovies(text:String) -> [Int : [Movies]] {
        searchForMovies(text:text)
        sortMovies()
        return categorizeByYear()
    }
    
    func searchForMovies(text:String) {
        if let movies = movieList?.movies {
        searchedMovieList.movies.append(contentsOf: movies.filter{$0.title.lowercased().contains(text.lowercased())})
        }
    }
    
    func sortMovies() {
        searchedMovieList.movies.sortByRate()
    }
    
    func categorizeByYear() -> [Int:[Movies]] {
        for movie in searchedMovieList.movies {
            if moviesDic[movie.year] == nil {
                moviesDic[movie.year] = [movie]
            }
            else if (moviesDic[movie.year]?.count ?? 0) < topCount  {
                moviesDic[movie.year]?.append(movie)
            }
        }
        return moviesDic
    }
    
    func sortDictionaryKeys(moviesDictionary: [Int:[Movies]]) -> [Int] {
        return Array(moviesDictionary.keys.sorted())
    }
    
    func clear() -> [Int : [Movies]] {
        searchedMovieList.movies = []
        moviesDic = [:]
        return moviesDic
    }
    
}
