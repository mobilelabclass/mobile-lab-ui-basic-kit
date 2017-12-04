//
//  DefaultUIViewController.swift
//  MobileLabUIKit
//
//  Created by Nien Lam on 12/4/17.
//  Copyright © 2017 Mobile Lab. All rights reserved.
//

import UIKit

class DefaultUIViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buttonOutputLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!

    @IBOutlet weak var textfieldOutputLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var sliderOutputLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!

    @IBOutlet weak var switchOutputLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    var counter = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Required for textfield delegate methods.
        myTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func handleButton(_ sender: UIButton) {
        counter = counter + 1
        buttonOutputLabel.text = "Button: \(counter)"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfieldOutputLabel.text = "Text: \(textField.text!)"
        
        // Dismisses keyboard when done is pressed.
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func handleSlider(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        sliderOutputLabel.text = "Slider: \(sliderValue)"
    }
    
    @IBAction func handleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOutputLabel.text = "Switch: On"
        } else {
            switchOutputLabel.text = "Switch: Off"
        }
    }
}
