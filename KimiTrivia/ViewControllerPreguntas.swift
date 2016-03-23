//
//  ViewControllerPreguntas.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 19/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class ViewControllerPreguntas: UIViewController {

    @IBOutlet weak var progressTime: UIProgressView!
    @IBOutlet weak var viewResultados: UIView!
    
    //Variables de Control
    var titulo: String = ""
    var player: jugador = jugador()
    var nivel: Int = 0
    var timer = NSTimer()
    var counter: Float = 1.0
    var TIEMPO_MAX: Float = 30.0
    
    
    //Variables del cuestionario
    var pregContestadas = 0
    var p1 = false
    var p2 = false
    var p3 = false
    var p4 = false
    var p5 = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(titulo)
        //print(player)
        //print(nivel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
        progressTime.progress = 1 - Float(counter)/TIEMPO_MAX
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(){
        counter += 0.01
        progressTime.progress = 1.0 - counter / TIEMPO_MAX
        print(counter)
        
        
        if(counter >= TIEMPO_MAX || pregContestadas == 5){
            timer.invalidate()
            print(counter)
            viewResultados.hidden = false
           
        }
        
    }
    
    @IBAction func respondePregunta(sender: UIButton) {
        pregContestadas++;
        
        if(pregContestadas > 5){
            pregContestadas = 5
        }
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
