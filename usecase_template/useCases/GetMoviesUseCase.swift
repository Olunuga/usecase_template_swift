//
//  GetMoviesUseCase.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

class GetMoviesUseCase {
    var movieRepo : MovieRepoProtocol
    
    
    init(movieRepo : MovieRepoProtocol) {
        self.movieRepo = movieRepo
    }
    
    
    func invoke(type: MovieType, completion :@escaping (_ result : Result<Array<Movie>>)-> Void){
        
        let movieRequestModel = MoviesRequestModel()
        movieRequestModel.page = 1
        movieRepo.getMovies(type: type, requestModel:movieRequestModel , completion: {
            result in
            switch result{
            case .success(let data):
                debugPrint("Get MovieUseCase response \(data)")
                completion(result)
            case .failed(let message, let errorCode):
                debugPrint("Get MovieUseCase  error response message :\(message) and code : \(errorCode)")
                completion(result)
            }
        })
        
    }
    
}
