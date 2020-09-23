//
//  WriteController.swift
//  File
//
//  Created by Mário Galvao on 22/09/20.
//

import UIKit

class WriteController: UIViewController {
    
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var textFieldKey: UITextField!
    @IBOutlet weak var textFieldValue: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clear()
    }
    
    private func clear() {
        textFieldKey.text = nil
        textFieldValue.text = nil
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        clear()
        if sender.selectedSegmentIndex == 0 {
            labelKey.text = "Key"
            labelValue.text = "Value"
        } else {
            labelKey.text = "Filename"
            labelValue.text = "File Text"
        }
    }
    
    
    @IBAction func write(_ sender: UIButton) {
        if segmentedControl.selectedSegmentIndex == 0 {
            writeValue()
        } else {
            writeFile()
        }
        textFieldKey.text = nil
        textFieldValue.text = nil
    }
    
    private func writeValue() {
        UserDefaults.standard.setValue(textFieldValue.text ?? "",
                                       forKey: textFieldKey.text ?? "")
    }
    
    private func writeFile() {
        let str = textFieldValue.text ?? ""
        let filename = getDocumentsDirectory().appendingPathComponent("\(textFieldKey.text ?? "").txt")

        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Erro ao salvar arquivo.")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}

