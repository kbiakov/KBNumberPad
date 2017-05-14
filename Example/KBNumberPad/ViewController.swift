//
//  ViewController.swift
//  KBNumberPad
//
//  Created by Kirill Biakov on 01/22/2017.
//  Copyright (c) 2017 Kirill Biakov. All rights reserved.
//

import UIKit
import KBNumberPad

class ViewController: UIViewController, KBNumberPadDelegate {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberPad = ViewController.createNumberPad()
        numberPad.delegate = self
        textField.inputView = numberPad
    }
    
    // MARK: - KBNumberPadDelegate
    
    func onNumberClicked(numberPad: KBNumberPad, number: Int) {
        NSLog("Number clicked %d", number)
    }
    
    func onDoneClicked(numberPad: KBNumberPad) {
        NSLog("Done clicked")
    }
    
    func onClearClicked(numberPad: KBNumberPad) {
        NSLog("Clear clicked")
    }
    
    // MARK: - Private methods
    
    private static func createNumberPad() -> KBNumberPad {
        let numberPad = KBNumberPad()
        numberPad.setDelimiterColor(UIColor.lightGray)
        numberPad.setButtonsColor(UIColor.black)
        numberPad.setButtonsBackgroundColor(UIColor.white)
        return numberPad
    }
}
