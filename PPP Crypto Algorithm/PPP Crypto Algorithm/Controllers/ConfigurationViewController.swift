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
    
    var passcodeLength: Int = 4
    var sequenceKey: String?{
        willSet{
            sequenceKeyLabel.text = newValue
        }
    }
    var characterSet = "!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sequenceKey = SecurityWithCryptoKit.shared.generateSequenceKey()
    }

    @IBAction func generateNewKey(_ sender: UIButton) {
        sequenceKey = SecurityWithCryptoKit.shared.generateSequenceKey()
    }
    
    @IBAction func applySuggestedCharacterSet(_ sender: UIButton) {
        characterSetTextField.text = characterSet
    }
    
    @IBAction func changePasscodeLength(_ sender: UIStepper) {
        passcodeLengthLabel.text = "\(Int(sender.value))"
    }

    @IBAction func generateCards(_ sender: UIButton) {
        guard let charSet = characterSetTextField.text else { return }
        if charSet == "" || charSet.count < 3{
            present(AlertsCreator(title: "Error", message: "Longitud de conjunto de caracteres inválido").createAlert(), animated: true)
            return
        }
        guard let passCode = Int(passcodeLengthLabel.text ?? "4") else { return }
        CardsManager.shared.generateCards(configuration: CardsConfiguration(characterSet: charSet, passcodeLength: passCode))
    }
    
    func initialSetup(){
        passcodeLengthStepper.value = Double(passcodeLength)
        passcodeLengthStepper.minimumValue = 3.0
        passcodeLengthStepper.maximumValue = 8.0
        characterSetTextField.text = characterSet
    }
}

