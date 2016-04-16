//
//  ViewControllerAutores.swift
//  KimiTrivia
//
//  Created by Leonardo Gutiérrez on 4/15/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerAutores: UIViewController {

    
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sonidoBoton(sender: AnyObject) {
        audioClick.play()
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
