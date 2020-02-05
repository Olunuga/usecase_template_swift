//
//  ViewController.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 19/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    var loginViewModel : LoginViewModel?
    var homeViewModel : HomeViewModel?
     private let disposeBag = DisposeBag()
    private var loginResultDisposable : Disposable?

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Initializer for Auth UseCase
        let remoteDataSource = AuthRemoteDataSource()
        let authRepository =  AuthRespository(remoteDataSource: remoteDataSource)
        let loginUseCase = LoginUseCase(authRepository: authRepository)
        loginViewModel = LoginViewModel(loginUseCase: loginUseCase)
        
        
        //Initializer for Movie UseCase
        let moviedataSource = MovieRemoteDataSource()
        let movieRepository =  MovieRepository(localMovieSource: moviedataSource, remoteMovieSource: moviedataSource)
        let getMoviesUseCase = GetMoviesUseCase(movieRepo: movieRepository)
        homeViewModel = HomeViewModel(getMoviesUseCase:getMoviesUseCase)
        
    
        //loginViewModel?.login()
        homeViewModel?.loadAll()
        
   loginResultDisposable = loginViewModel?.loginResult.observeOn(MainScheduler.instance).bind(onNext: {
            loginResult in
                switch loginResult{
                case .loading(let isLoading):
                    //show activity view
                    debugPrint("login is loading \(isLoading)")
                    self.activityIndicator?.isHidden = false
                    break;
                case .success:
                    //navigate to new screen
                    debugPrint("login successful!")
                    self.activityIndicator?.isHidden = true
                    break;
                case .failed(let message):
                    //shoe message to user
                    debugPrint("login failed with message \(message)")
                    self.activityIndicator?.isHidden = true
                    break;
                }
    
        })
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let loginDisposable = loginResultDisposable{
            loginDisposable.disposed(by: disposeBag)
        }
    }
}

