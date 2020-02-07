//
//  PasswordsCreator.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 07/02/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit

struct  PasswordsCreator {
    
    static var shared = PasswordsCreator()
    var counter: UInt128 = 0
        
    mutating func getPassword(characterSet: String, passcodeLength: Int) -> String {
        var pass = ""
        for _ in 1...passcodeLength{
            guard let encryptedCounter = SecurityWithCryptoKit.shared.getUInt128Encrypted(counter: counter) else {
                return ""
            }
            counter += 1
            let remainder = encryptedCounter % UInt128(characterSet.count)
            let indexOfCharacterSet = Int(remainder)
            let alphabet: [String] = Array(characterSet).map({String($0)})
            pass = pass + alphabet[indexOfCharacterSet]
        }
        return pass
    }
    
    mutating func resetCounter(){
        counter = 0
    }
    
}
