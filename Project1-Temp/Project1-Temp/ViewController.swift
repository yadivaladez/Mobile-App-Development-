//
//  ViewController.swift
//  Project1-Temp
//
//  Created by Yadira Valadez on 9/17/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var celsiusOutput: UILabel!
    @IBOutlet weak var fahrenheitOutput: UILabel!
    @IBOutlet weak var kelvinOutput: UILabel!
    
    @IBOutlet weak var celsiusInput: UITextField!
    
    @IBOutlet weak var fahrenheitInput: UITextField!
    
    @IBOutlet weak var kelvinInput: UITextField!
    
    func fahrenheitTemps() {
        let celsiusToFah = (celsiusInput.text as NSString).floatValue
       let conversion = celsiusToFah * (5/9) + 32
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

