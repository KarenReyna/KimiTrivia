//
//  ViewControllerNivel.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 18/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerNivel: UIViewController {

    @IBOutlet weak var lblNivel: UILabel!
    var titulo: String = "aaa"
    var player: jugador = jugador()
    
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    
    //BotonesNiveles
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNivel.text = titulo

        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        
        var puntos: Int = 0
        
        if(titulo == "Básico"){
            puntos = player.puntosBasico
        }
        else if (titulo == "Intermedio"){
            puntos = player.puntosIntermedio
        }
        else if(titulo == "Avanzado"){
            puntos = player.puntosAvanzado
        }
        
        if(puntos < 5){
            btn2.enabled = false
        }
        if(puntos < 10){
            btn3.enabled = false
        }
        if(puntos < 15){
            btn4.enabled = false
        }
        if(puntos < 20){
            btn5.enabled = false
        }
        if(puntos < 25){
            btn6.enabled = false
        }
        if(puntos < 30){
            btn7.enabled = false
        }
        if(puntos < 35){
            btn8.enabled = false
        }
        if(puntos < 40){
            btn9.enabled = false
        }
        
    }

    @IBAction func botonSonido(sender: AnyObject){
       audioClick.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindNiveles(sender: UIStoryboardSegue) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if(segue.identifier == "1" || segue.identifier == "2" || segue.identifier == "3" || segue.identifier == "4" || segue.identifier == "5"){
            audioClick.play()
            let view: ViewControllerPreguntas = segue.destinationViewController as! ViewControllerPreguntas
            view.titulo = self.titulo
            view.player = self.player
            view.nivel = Int(segue.identifier!)!
        }
        
    }
    
}
