//
//  SecurityWithCryptoKit.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 07/02/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit
import CryptoKit

struct SecurityWithCryptoKit{
    
    static var shared = SecurityWithCryptoKit()
    var sequenceKey: SymmetricKey?
    
    private func createSequenceKey() -> SymmetricKey{
        return SymmetricKey(size: .bits256)
    }
    
    func getStringFromSymetricKey() -> String{
        guard let sequenceKey = sequenceKey else { return ""}
        let keyb64 = sequenceKey.withUnsafeBytes {
            Data(Array($0)).base64EncodedString()
        }
        return keyb64
    }
    
    mutating func generateSequenceKey() -> String{
        sequenceKey = createSequenceKey()
        return getStringFromSymetricKey()
    }
    
    func retrieveSymmetricKeyFromStringBase64(keyb64: String) -> SymmetricKey?{
        if let data = Data(base64Encoded: keyb64){
            return SymmetricKey(data: data)
        }
        return nil
    }
    
    mutating func restoreKey(keyb64: String){
        sequenceKey = retrieveSymmetricKeyFromStringBase64(keyb64: keyb64)
    }
    
    private func encryptInteger(number: UInt128, key: SymmetricKey) -> Data{
        // convert from Int to Data
        let data = withUnsafeBytes(of: number) {
            Data($0)
        }
//        var counter = number
//        let data = Data(bytes: &counter, count: MemoryLayout.size(ofValue: counter))
        //    Encrypt with AES from CryptoKit
        let encryptedContent = try! AES.GCM.seal(data, using: key).combined
        let sealedBox = try! AES.GCM.SealedBox(combined: encryptedContent!)
        return sealedBox.ciphertext
    }
    
    private func convertDataToNumber(data: Data) -> UInt128{
//        let value = data.withUnsafeBytes {
//            $0.load(as: UInt128.self)
//        }
        let value = data.withUnsafeBytes {
            $0.bindMemory(to: UInt128.self)[0]
        }
        return value
    }
    
    func getUInt128Encrypted(counter: UInt128) -> UInt128?{
        if let key = sequenceKey{
            let encryptedData = encryptInteger(number: counter, key: key)
            let number = convertDataToNumber(data: encryptedData)
            return number
        }
        return nil
    }
}
