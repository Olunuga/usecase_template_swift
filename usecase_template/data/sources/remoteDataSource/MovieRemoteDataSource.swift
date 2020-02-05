//
//  MovieRemoteDataSource.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//https://api.themoviedb.org/3/movie/550?api_key=25d6c374b69cf0a9fb67d15896484dc5

class MovieRemoteDataSource : MovieDataSourceProtocol {
    
    func getMovies(type: MovieType, requestModel: MoviesRequestModel, completion: @escaping (Result<Array<Movie>>) -> Void) {
        
        let params : Parameters = [
            "api_key": requestModel.api_key,
            "page": requestModel.page ?? 1
        ]
        
        var movieTypeString = ""
        
        switch type {
        case .Popular:
            movieTypeString = "popular"
        case .NowPlaying:
            movieTypeString = "now_playing"
        case .TopRated:
            movieTypeString = "top_rated"
        }
        
        Alamofire.request("https://api.themoviedb.org/3/movie/\(movieTypeString)",
                          method: .get,
                          parameters: params
                          ).response(completionHandler: {
            response in
                            
                            if let error = response.error {
                                 debugPrint("get moviee response \(error.localizedDescription)")
                           
                            }
                            
                            if let data = response.data {
                                let jsonData = JSON(data).string?.data(using: .utf8)!
                                
                                if let rawData = jsonData {
                                     let movieList = try! JSONDecoder().decode([Movie].self, from: rawData)
                                    
                                  debugPrint("get moviee response as object \(movieList[0].title)")
                                }
        
                                 debugPrint("get moviee response \(JSON(data))")
                            }
                            
                            
           
        }
        )
    }
    
    func getMovieDetail(movieId: UInt32, completion: @escaping (Result<Movie>) -> Void) {
        
    }
    
    
}
