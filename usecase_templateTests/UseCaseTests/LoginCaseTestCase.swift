//
//  AuthUseCaseTestCase.swift
//  usecase_templateTests
//
//  Created by OLUNUGA Mayowa on 21/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import XCTest
@testable import usecase_template


class LoginUseCaseTestCase: XCTestCase {
    var failureMessage: String!
    var username: String!
    var password : String!
    var authRepo : AuthRepositoryMock!
    var loginUseCase:LoginUseCase!
    

    override func setUp() {
        failureMessage = "TestLoginWithEmailAndPasswordSuccessful failed because completion handler failed to return success enum case"
        
        username = "someText"
        password = "somePassword"
    }

    override func tearDown() {
    }

    func testLoginWithEmailAndPasswordSuccessful(){
        authRepo = AuthRepositoryMock()
        authRepo.give(result: Result.success(LoginResponseModel(userId: "12")))
        loginUseCase = LoginUseCase(authRepository: authRepo)
        
        var mResult: Result<LoginResponseModel>?
        
        loginUseCase.invoke(username: username, password: password){
            result in
            mResult = result
        }
        if let result = mResult{
            switch result{
            case .success( _):
                break
            case .failed( _, _):
                XCTFail(failureMessage)
             }
        }else{
           XCTFail(failureMessage)
        }
        
    }
    
    func testLoginWithEmailAndPasswordFailed(){
        authRepo = AuthRepositoryMock()
        authRepo.give(result: Result.failed("", 0))
        loginUseCase = LoginUseCase(authRepository: authRepo)
    
        var mResult: Result<LoginResponseModel>?
        loginUseCase.invoke(username: username, password: password){
            result in
            mResult = result
        }
        if let result = mResult{
            switch result{
            case .success( _):
                XCTFail(failureMessage)
                break
            case .failed( _, _):
                break
            
            }
        }else{
            XCTFail(failureMessage)
        }
        
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}

//MARK - Mocks
class AuthRepositoryMock : AuthRepoProtocol{
   private var methodToCall: Result<LoginResponseModel>?
    
    func login(requestModel: LoginRequestModel, completion: @escaping (Result<LoginResponseModel>) -> Void) {
        
        if let result = methodToCall {
            completion(result)
        } else{
            let loginResponseModel = LoginResponseModel(userId: "12")
            completion(Result.success(loginResponseModel))
        }
    }
    
    func signUp(requestModel: SignUpRequestModel, completion: (Result<Any>) -> Void) {
        
    }
    
    func give(result : Result<LoginResponseModel>){
        methodToCall = result
    }
}
