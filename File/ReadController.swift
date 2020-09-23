//
//  ReadController.swift
//  File
//
//  Created by Mário Galvao on 22/09/20.
//

import UIKit

class ReadController: UIViewController {
    
    @IBOutlet weak var textFieldKey: UITextField!
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelNoValue: UILabel!
    @IBOutlet weak var stackViewValue: UIStackView!
    @IBOutlet weak var labelFileContent: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clear()
    }
    
    private func clear() {
        labelNoValue.isHidden = true
        stackViewValue.isHidden = true
        textFieldKey.text = nil
        labelFileContent.text = nil
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        clear()
        if sender.selectedSegmentIndex == 0 {
            labelKey.text = "Key"
            labelValue.text = "Value:"
        } else {
            labelKey.text = "Filename"
            labelValue.text = "File Text:"
        }
    }
    
    @IBAction func search(_ sender: UIButton) {
        if segmentedControl.selectedSegmentIndex == 0 {
            searchValue()
        } else {
            searchFile()
        }
    }
    
    private func searchValue() {
        if let value = UserDefaults.standard.value(forKey: textFieldKey.text ?? "") as? String {
            showValue(value)
        } else {
            showNoValue()
        }
    }
    
    private func searchFile() {
        let filename = getDocumentsDirectory().appendingPathComponent("\(textFieldKey.text ?? "").txt")
        do {
            let fileText = try String(contentsOf: filename, encoding: .utf8)
            showValue(fileText)
        } catch {
            showNoValue()
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func showNoValue() {
        labelNoValue.isHidden = false
        stackViewValue.isHidden = true
    }
    
    private func showValue(_ value: String) {
        labelNoValue.isHidden = true
        stackViewValue.isHidden = false
        labelFileContent.text = value
    }

}
