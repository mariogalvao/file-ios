//
//  WriteController.swift
//  File
//
//  Created by Mário Galvao on 22/09/20.
//

import UIKit

class WriteController: UIViewController {
    
    @IBOutlet weak var textFieldKey: UITextField!
    @IBOutlet weak var textFieldValue: UITextField!
    
    @IBAction func write(_ sender: UIButton) {
        UserDefaults.standard.setValue(textFieldValue.text ?? "",
                                       forKey: textFieldKey.text ?? "")
        textFieldKey.text = nil
        textFieldValue.text = nil
    }
    
}

