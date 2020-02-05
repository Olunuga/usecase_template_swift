//
//  File.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

protocol MovieRepoProtocol {
    func getMovies(type: MovieType,requestModel : MoviesRequestModel, completion : @escaping(_ result : Result<Array<Movie>>)-> Void)
    func getMovieDetail(movieId : UInt32, completion : @escaping(_ result : Result<Movie>) -> Void)
}
