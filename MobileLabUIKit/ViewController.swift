//
//  ViewController.swift
//  MobileLabUIKit
//
//  Created by Nien Lam on 12/3/17.
//  Copyright © 2017 Mobile Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    // Outlets to default UI elements.
    @IBOutlet weak var defaultTextField: UITextField!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var defaultSlider: UISlider!

    // Outlets to custom UI elements.
    @IBOutlet weak var customInputField: UITextField!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var cusomSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        defaultTextField.delegate = self

        ////////////////////////////////////////////////////////////////////////////

        // Background colors for custom UI.
        let lightBlue = UIColor(red:0.05, green:0.71, blue:0.90, alpha:1.00)
        let darkBlue  = UIColor(red:0.01, green:0.20, blue:0.31, alpha:1.00)

        let clearImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 25))
        let lightBlueImage = UIImage(color: lightBlue, size: CGSize(width: 1, height: 25))
        let darkBlueImage = UIImage(color: darkBlue, size: CGSize(width: 1, height: 25))

        //
        customInputField.delegate = self

        //
        customButton.setBackgroundImage(lightBlueImage, for: .highlighted)

        //
        cusomSlider.setThumbImage(clearImage, for: .normal)
        cusomSlider.setMinimumTrackImage(lightBlueImage, for: .normal)
        cusomSlider.setMaximumTrackImage(darkBlueImage, for: .normal)
        cusomSlider.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Dismisses keyboard when done is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
