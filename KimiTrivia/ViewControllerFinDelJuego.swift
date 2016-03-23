//
//  ViewControllerFinDelJuego.swift
//  KimiTrivia
//
//  Created by Leonardo Gutiérrez on 3/19/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class ViewControllerFinDelJuego: UIViewController {

    @IBOutlet weak var imgP1: UIImageView!
    @IBOutlet weak var imgP2: UIImageView!
    @IBOutlet weak var imgP3: UIImageView!
    @IBOutlet weak var imgP4: UIImageView!
    @IBOutlet weak var imgP5: UIImageView!
    
    
    
    @IBOutlet weak var imagenGP: UIImageView!
    var imagen: String = "perdiste"
    var player: jugador = jugador()
    
    var logo1: UIImage = UIImage(named: "Perdiste1")!
    var logo2: UIImage = UIImage(named: "Perdiste2")!
    var logo3: UIImage = UIImage(named: "Perdiste3")!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            imagenGP.animationImages = [logo1, logo2, logo3]
            imagenGP.animationDuration = 1
            imagenGP.startAnimating()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
