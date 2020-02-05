//
//  HomeViewModel.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 29/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelOutputs {
    var popularMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>> { get }
    var TrendingMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>> { get }
    var NowPlayingMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>> { get }
}

class HomeViewModel: HomeViewModelOutputs {    
    var callResult : ViewModelResult<Array<Movie>>
    var getMoviesUseCase : GetMoviesUseCase
    
    //Outputs
    var popularMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>>
    var TrendingMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>>
    var NowPlayingMoviesResult: BehaviorSubject<ViewModelResult<Array<Movie>>>
    
    
    
    init(getMoviesUseCase : GetMoviesUseCase) {
        self.getMoviesUseCase = getMoviesUseCase
        
        callResult = ViewModelResult.loading(true)
        
        //Set all the data as loading
        popularMoviesResult =  BehaviorSubject.init(value: callResult)
        TrendingMoviesResult =  BehaviorSubject.init(value: callResult)
        NowPlayingMoviesResult = BehaviorSubject.init(value: callResult)
    }
    
    func loadAll(){
        getPopular(page: 1)
        getTrending(page: 1)
        getNowPlaying(page: 1)
    }
    
    
    func getPopular(page : UInt) {
        getMoviesUseCase.invoke(type: .Popular){
            result in
            switch result {
            case .success(let data):
                debugPrint("Load popular data \(data)")
                self.callResult = ViewModelResult.success(data)
            case.failed(let errorMessage, let errorCode):
                debugPrint("Failed to load popular with message \(errorMessage) \(errorCode)")
            }
        }
    }
    
    func getTrending(page : UInt) {
        
    }
    
    func getNowPlaying(page : UInt) {
        
    }
}

