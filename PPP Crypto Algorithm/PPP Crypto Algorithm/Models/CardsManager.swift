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
    var cards = [[String]]()
    var temporalArraywithPasswords = [String]()
    
    mutating func generateCards(configuration: CardsConfiguration){
        for _ in 1 ... configuration.numberOfCards{
            for _ in 1 ... 16{
                temporalArraywithPasswords.append(PasswordsCreator.shared.getPassword(characterSet: configuration.characterSet, passcodeLength: configuration.passcodeLength))
            }
            cards.append(temporalArraywithPasswords)
            temporalArraywithPasswords.removeAll()
        }
        PasswordsCreator.shared.resetCounter()
    }
    
    mutating func resetCards(){
        cards.removeAll()
    }
}
