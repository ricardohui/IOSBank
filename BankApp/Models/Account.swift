//
//  Account.swift
//  BankApp
//
//  Created by Ricardo on 27/5/2020.
//  Copyright © 2020 Ricardo Hui. All rights reserved.
//

import Foundation

enum AccountError: Error{
    case insufficientFunds
}
struct Account{
    var balance:Double = 0.0;
    
     mutating func deposit(_ amount: Double){
        self.balance += amount
    }
    mutating func withdraw(_ amount: Double) throws {
        let netBalance = self.balance - amount;
        if netBalance < 0{
            throw AccountError.insufficientFunds
        }else{
            self.balance -= amount
        }
    }
}
