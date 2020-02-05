//
//  LoginViewModelTest.swift
//  usecase_templateTests
//
//  Created by OLUNUGA Mayowa on 22/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import usecase_template

class LoginViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//        let scheduler = TestScheduler(initialClock: 0)
//        scheduler.createObserver(LoginResult.self)
//
//        //Provie mock loginUseCase
//        let viewModel = LoginViewModel(loginUseCase: <#T##LoginUseCase#>)
//        let disposeBag = DisposeBag()
//
//        viewModel.loginResult.asDriver(onErrorJustReturn: "There was an error").drive(testString).disposed(by: disposeBag)
//
//        scheduler.createColdObservable(.next(10, LoginResult.loading(true)))
//            .disposed(by: disposeBag)
//
//        scheduler.start()
//
//        XCTAssertEqual(viewModel.loginResult, [.next(0, LoginResult.success)], "The observable sequence didn’t look quite right. Failing the test.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
