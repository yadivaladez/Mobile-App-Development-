//
//  ViewController.swift
//  Lab2
//
//  Created by Yadira Valadez on 9/22/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var loadedImage: UIImageView!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var slider: UISlider!
    
    //example code from in class lecture/beatles example
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0 {
            artistName.text="Abel 'The Weeknd' Tesfaye"
            loadedImage.image=UIImage(named: "artist")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            artistName.text="The Beauty Behind the Madness"
            loadedImage.image=UIImage(named: "album")
        }
    }
    @IBAction func changeInfo(sender: UISegmentedControl) {
        updateImage()
    }
    //changes the background color, the slider "slides" through various RBG values to change the color-- still working on how to get back to the default

    @IBAction func sliderValueChanged(sender: UISlider) {
        
        // creates variable to hold new color
        var newBackgroundColor : UIColor
        
        // creates variable holding the value from slider
        let sliderValue = CGFloat(slider.value)
        
        // changes the newBackgroundColor variable to new color values.
        newBackgroundColor = UIColor(hue: sliderValue, saturation: 0.9, brightness: 0.9, alpha: 0.6)
        
        // changes the background color
        self.view.backgroundColor = newBackgroundColor
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

