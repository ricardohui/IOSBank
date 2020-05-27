//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Ricardo on 27/5/2020.
//  Copyright © 2020 Ricardo Hui. All rights reserved.
//

import XCTest
@testable import BankApp
class BankAppTests: XCTestCase {
    private var account: Account!
    // called BEFORE each test
    override func setUp() {
        super.setUp()
        self.account = Account()
        
    }
    
    func test_WithdrawFromInsufficientBalance(){
        self.account.deposit(100)
        XCTAssertThrowsError(try self.account.withdraw(300)){error in
            XCTAssertEqual(error as! AccountError, AccountError.insufficientFunds)
        }
    }
       func test_InitialBalanceZero(){
      
        XCTAssertTrue(self.account.balance == 0, "Balance is not zero!")
    }
    
    func test_DepositFunds(){
       
        self.account.deposit(100)
        XCTAssertEqual(100, self.account.balance)
    }
    
    func test_WithdrawFunds(){
         self.account.deposit(100)
        try? self.account.withdraw(300)
        XCTAssertTrue(self.account.balance==100, "Balance is not zero")
        XCTAssertEqual(100, self.account.balance)
    }
// called AFTER each test
    override class func tearDown(){
        super.tearDown()
    }
}
