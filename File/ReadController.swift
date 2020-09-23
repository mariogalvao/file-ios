//
//  ReadController.swift
//  File
//
//  Created by Mário Galvao on 22/09/20.
//

import UIKit

class ReadController: UIViewController {
    
    @IBOutlet weak var textFieldKey: UITextField!
    @IBOutlet weak var labelNoValue: UILabel!
    @IBOutlet weak var stackViewValue: UIStackView!
    @IBOutlet weak var labelValue: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        labelNoValue.isHidden = true
        stackViewValue.isHidden = true
        textFieldKey.text = nil
        labelValue.text = nil
    }

    @IBAction func search(_ sender: UIButton) {
        if let value = UserDefaults.standard.value(forKey: textFieldKey.text ?? "") as? String {
            showValue(value)
        } else {
            showNoValue()
        }
    }
    
    private func showNoValue() {
        labelNoValue.isHidden = false
        stackViewValue.isHidden = true
    }
    
    private func showValue(_ value: String) {
        labelNoValue.isHidden = true
        stackViewValue.isHidden = false
        labelValue.text = value
    }

}
