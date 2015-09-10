//
//  ViewController.swift
//  Lab1
//
//  Created by Yadira Valadez on 9/10/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainImage: UIImageView!
  
    @IBAction func changePic(sender: UIButton) {
        if sender.tag == 1{
            mainImage.image = UIImage(named: "leo")
        }
        else if sender.tag == 2{
            mainImage.image=UIImage(named: "leopard")
        }
        else if sender.tag == 3{
            mainImage.image=UIImage(named: "chicago")
        }
        
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

