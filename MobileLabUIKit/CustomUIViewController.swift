//
//  CustomUIViewController.swift
//  MobileLabUIKit
//
//  Created by Nien Lam on 12/3/17.
//  Copyright © 2017 Mobile Lab. All rights reserved.
//

import UIKit

class CustomUIViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var buttonOutputLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!

    @IBOutlet weak var textfieldOutputLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var sliderOutputLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    
    var counter = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        // #0EB4E6
        let lightBlue = UIColor(red:0.05, green:0.71, blue:0.90, alpha:1.00)
        
        // 02344E
        let darkBlue  = UIColor(red:0.01, green:0.20, blue:0.31, alpha:1.00)
        
        let clearImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 25))
        let lightBlueImage = UIImage(color: lightBlue, size: CGSize(width: 1, height: 25))
        let darkBlueImage = UIImage(color: darkBlue, size: CGSize(width: 1, height: 25))

        myButton.setBackgroundImage(lightBlueImage, for: .highlighted)

        // Required for textfield delegate methods.
        myTextField.delegate = self
        
        //
        mySlider.setThumbImage(clearImage, for: .normal)
        mySlider.setMinimumTrackImage(lightBlueImage, for: .normal)
        mySlider.setMaximumTrackImage(darkBlueImage, for: .normal)
        mySlider.clipsToBounds = true
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
    
}

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
