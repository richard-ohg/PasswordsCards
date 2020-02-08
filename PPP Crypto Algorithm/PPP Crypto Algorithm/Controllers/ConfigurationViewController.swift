//
//  ViewController.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 30/01/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var sequenceKeyLabel: UILabel!
    @IBOutlet weak var characterSetTextField: UITextField!
    @IBOutlet weak var passcodeLengthLabel: UILabel!
    @IBOutlet weak var passcodeLengthStepper: UIStepper!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    @IBOutlet weak var numberOfCardsStepper: UIStepper!
    
    private let passcodeLength: Int = 4
    private let numberOfCards: Int = 3
    private let characterSet = "!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    private let keyForKeychain = "sequenceKey"
    
    var sequenceKey: String?{
        willSet{
            sequenceKeyLabel.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
 
    @IBAction func generateNewKey(_ sender: UIButton) {
        KeychainManager.shared.deleteKey(key: keyForKeychain)
        sequenceKey = SecurityWithCryptoKit.shared.generateSequenceKey()
    }
    
    @IBAction func applySuggestedCharacterSet(_ sender: UIButton) {
        characterSetTextField.text = characterSet
    }
    
    @IBAction func changePasscodeLength(_ sender: UIStepper) {
        passcodeLengthLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func changeNumberOfCards(_ sender: UIStepper) {
        numberOfCardsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func generateCards(_ sender: UIButton) {
        guard let charSet = characterSetTextField.text else { return }
        if charSet == "" || charSet.count < 3{
            present(AlertsCreator(title: "Error", message: "Longitud de conjunto de caracteres inválido").createAlert(), animated: true)
            return
        }
        guard let passCode = Int(passcodeLengthLabel.text ?? "4") else { return }
        guard let numCards = Int(numberOfCardsLabel.text ?? "3") else { return }
        guard let seqKey = sequenceKey else { return }
        KeychainManager.shared.saveKey(data: seqKey, key: keyForKeychain)
        CardsManager.shared.generateCards(configuration: CardsConfiguration(characterSet: charSet, passcodeLength: passCode, numberOfCards: numCards))
    }
    
    func initialSetup(){
        passcodeLengthStepper.value = Double(passcodeLength)
        numberOfCardsStepper.value = Double(numberOfCards)
        passcodeLengthStepper.minimumValue = 3.0
        passcodeLengthStepper.maximumValue = 10.0
        numberOfCardsStepper.minimumValue = 1.0
        numberOfCardsStepper.maximumValue = 8.0
        characterSetTextField.text = characterSet
        if let retrieveSeqKey = KeychainManager.shared.retrieveKey(key: keyForKeychain) {
            sequenceKey = retrieveSeqKey
        }else{
            sequenceKey = SecurityWithCryptoKit.shared.generateSequenceKey()
        }
    }
}

