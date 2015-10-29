//
//  ViewController.swift
//  Midterm
//
//  Created by Yadira Valadez on 10/29/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var commuteInput: UITextField!
    @IBOutlet weak var commuteTimeLabel: UILabel!
    @IBOutlet weak var gasInTankLabel: UILabel!
    @IBOutlet weak var gasSlider: UISlider!
    @IBOutlet weak var gasNeededLabel: UILabel!
    @IBOutlet weak var transportationImage: UIImageView!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0 {
            transportationImage.image=UIImage(named: "car")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            transportationImage.image=UIImage(named: "bike")
        }
        else if imageControl.selectedSegmentIndex == 2 {
            transportationImage.image=UIImage(named: "bus")
        }
    }
    
    @IBAction func updateTransportationImage(sender: UISegmentedControl) {
        updateImage()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func updateCommuteTime() {
        let comTime = (commuteInput.text as NSString).floatValue
        let totalTime = comTime * 60/20
        if comTime > 50 {
            let alert = UIAlertController(title: "Warning", message: "Your commute is greater the 50 miles", preferredStyle: UIAlertControllerStyle.Alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                self.updateCommuteTime()})
            
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        
        var minuteFormatter = NSNumberFormatter()
        minuteFormatter.numberStyle=NSNumberFormatterStyle.DecimalStyle
        commuteTimeLabel.text=minuteFormatter.stringFromNumber(totalTime)
    }
    
    
    @IBAction func computeCommute(sender: UIButton) {
        let comTime = (commuteInput.text as NSString).floatValue
        
        if comTime > 0 {
            updateCommuteTime()
        }
    }
    func textFieldDidEndEditing(textField: UITextField) {
       updateCommuteTime()
    }
    
    
    @IBAction func updateGasNumbers(sender: UISlider) {
        
        let gasInTank=sender.value
        gasInTankLabel.text=String(format: "%.0f",gasInTank)
        let comTime = (commuteInput.text as NSString).floatValue
        var gasNeedBuy = Int(sender.value) * 24
        //let gasNeeded=sender.value
        gasNeededLabel.text = "\(gasNeedBuy)"
    }
    
    override func viewDidLoad() {
        commuteInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

