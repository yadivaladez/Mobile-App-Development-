//
//  ViewController.swift
//  animation
//
//  Created by Yadira Valadez on 10/6/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delta = CGPointMake(12, 4)
    var ballRadius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changesSliderValue()
    }
    @IBOutlet weak var imageView: UIImageView!
    
    func moveImage(){
        /*imageView.center=CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y)
        if imageView.center.x > view.bounds.size.width - ballRadius || imageView.center.x < ballRadius {
            delta.x = -delta.x
        }
        if imageView.center.y > view.bounds.size.height - ballRadius || imageView.center.y < ballRadius{
            delta.y = -delta.y
        }*/
        let duration=Double(slider.value)
        UIView.beginAnimations("soccer_ball", context: nil)
        UIView.animateWithDuration(duration, animations: {self.imageView.transform=CGAffineTransformMakeTranslation(self.translation.x, self.translation.y)
            self.translation.x += self.delta.x
            self.translation.y += self.delta.x
        })
            
        UIView.commitAnimations()
        if imageView.center.x + translation.x > view.bounds.size.width - ballRadius || imageView.center.x + translation.x < ballRadius{
            delta.x = -delta.x
        }
    
         if imageView.center.y + translation.y > view.bounds.size.height - ballRadius || imageView.center.y + translation.y < ballRadius{
            delta.y = -delta.y
        
        }}
    
    @IBAction func changesSliderValue()
    {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    override func viewDidLoad() {
        ballRadius=imageView.frame.size.width/2
        changesSliderValue()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

