//
//  ViewController.swift
//  Lab3
//
//  Created by Yadira Valadez on 9/24/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var inputF: UITextField!
    @IBOutlet weak var inputC: UITextField!
    
    @IBOutlet weak var resultF: UILabel!
    
    
    @IBOutlet weak var resultC: UILabel!
    
    func updateTemp(){
        let tempFarenheit = (inputF.text as NSString).floatValue
        let tempCelsius = ((inputF.text as NSString)).floatValue * (5/9) + 32
        let faren = inputF.text.toInt()
        let farenToCel = inputF.text.toInt()!
        let celOne = farenToCel - 32
        let celTwo = celOne * 5
        let celTemp = celTwo/9
        if faren == 0 {

        
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "The temp input must be greater than 0", preferredStyle: UIAlertControllerStyle.Alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                    self.inputF.text="1"
                    self.updateTemp()
                })
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            } //end else
        
        

        
        
        
        
        var degreeFormatter = NSNumberFormatter()
        degreeFormatter.numberStyle=NSNumberFormatterStyle.DecimalStyle
    resultF.text=degreeFormatter.stringFromNumber(tempFarenheit)
      resultC.text=degreeFormatter.stringFromNumber(celTemp)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        updateTemp()
        
        
    }
    
    
    override func viewDidLoad() {
        inputC.delegate=self
        inputF.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

