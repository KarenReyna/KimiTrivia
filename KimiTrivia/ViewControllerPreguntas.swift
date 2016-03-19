//
//  ViewControllerPreguntas.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 19/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class ViewControllerPreguntas: UIViewController {

    var titulo: String = ""
    var player: jugador = jugador()
    var nivel: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(titulo)
        //print(player)
        print(nivel)
        
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
