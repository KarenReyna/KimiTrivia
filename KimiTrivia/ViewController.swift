//
//  ViewController.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 18/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var UIVLogo: UIImageView!
    
    var logo1: UIImage = UIImage(named: "logo1")!
    var logo2: UIImage = UIImage(named: "logo2")!
    var logo3: UIImage = UIImage(named: "logo3")!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIVLogo.animationImages = [logo1, logo2, logo3]
        UIVLogo.animationDuration = 0.75
        UIVLogo.startAnimating()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

