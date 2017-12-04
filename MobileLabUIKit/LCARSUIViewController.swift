//
//  LCARSUIViewController.swift
//  MobileLabUIKit
//
//  Created by Nien Lam on 12/4/17.
//  Copyright © 2017 Mobile Lab. All rights reserved.
//

import UIKit

class LCARSUIViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for button in buttons {
            button.layer.cornerRadius = 22.0
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
