//
//  CardsManager.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 07/02/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit

struct CardsManager{
    
    static var shared = CardsManager()
    var cards = [String]()
    var passwordCreator: PasswordsCreator = PasswordsCreator.shared
    
    mutating func generateCards(configuration: CardsConfiguration){
        for _ in 1...3{
            cards.append(passwordCreator.getPassword(characterSet: configuration.characterSet, passcodeLength: configuration.passcodeLength))
        }
    }
}
