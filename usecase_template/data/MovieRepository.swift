//
//  MovieRepository.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

class MovieRepository : MovieRepoProtocol{
    let localMovieSource : MovieDataSourceProtocol
    let remoteMovieSource : MovieDataSourceProtocol
    
    
    init(localMovieSource: MovieDataSourceProtocol , remoteMovieSource: MovieDataSourceProtocol ) {
        self.localMovieSource = localMovieSource
        self.remoteMovieSource = remoteMovieSource
    }
    
    func getMovies(type: MovieType, requestModel: MoviesRequestModel, completion: @escaping (Result<Array<Movie>>) -> Void) {
        remoteMovieSource.getMovies(type: type, requestModel: requestModel, completion: completion)
    }
    
    func getMovieDetail(movieId: UInt32, completion: @escaping (Result<Movie>) -> Void) {
        remoteMovieSource.getMovieDetail(movieId: movieId, completion: completion)
    }
    
    
}
