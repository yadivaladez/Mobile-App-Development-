//
//  ViewController.swift
//  Lab1
//
//  Created by Yadira Valadez on 9/11/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBAction func changeImage(sender: UIButton) {
        if sender.tag == 1 {
            mainImage.image = UIImage(named: "chicago")
            
        }
        else if sender.tag == 2 {
            mainImage.image = UIImage(named: "leo")
        }
        else if sender.tag == 3 {
            mainImage.image = UIImage(named: "leopard")
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

