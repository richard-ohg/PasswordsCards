//
//  KeychainManager.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 08/02/20.
//  Copyright © 2020 unam. All rights reserved.
//

import Foundation

struct KeychainManager{
    
    static let shared = KeychainManager()
    let keychain = KeychainSwift()
    
    func retrieveKey(key: String) -> String?{
        return keychain.get(key)
    }
    
    func saveKey(data: String, key: String){
        keychain.set(data, forKey: key)
    }
    
    func deleteKey(key: String){
        keychain.delete(key) // Remove single key
    }
}
