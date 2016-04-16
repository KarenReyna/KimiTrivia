//
//  ViewControllerFinDelJuego.swift
//  KimiTrivia
//
//  Created by Leonardo Gutiérrez on 3/19/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerFinDelJuego: UIViewController {

    var sonidoMuestra = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("muestraRespuesta", ofType: "mp3")!)
    var audioMuestra = AVAudioPlayer()
    
    @IBOutlet weak var btnMenu: UIButton!
    
    @IBOutlet weak var imgP1: UIImageView!
    @IBOutlet weak var imgP2: UIImageView!
    @IBOutlet weak var imgP3: UIImageView!
    @IBOutlet weak var imgP4: UIImageView!
    @IBOutlet weak var imgP5: UIImageView!
    
    @IBOutlet weak var lblP1: UILabel!
    @IBOutlet weak var lblP2: UILabel!
    @IBOutlet weak var lblP3: UILabel!
    @IBOutlet weak var lblP4: UILabel!
    @IBOutlet weak var lblP5: UILabel!
    
    var timer = NSTimer()
    var counter: Float = 1.0
    var TIEMPO_MAX: Float = 5.0
    
    var imagen: String = "perdiste"
    var player: jugador = jugador()
    
    var imgCorrecto: UIImage = UIImage(named: "bien")!
    var imgIncorrecto: UIImage = UIImage(named: "mal")!
    
    var respuestas:[Bool] = [false,false,false,false,false]
    var preguntasFinal:[String] = ["1", "2", "3", "4", "5"]

    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: #selector(ViewControllerPreguntas.updateTimer), userInfo: nil, repeats: true)
        
        audioMuestra = try! AVAudioPlayer(contentsOfURL: sonidoMuestra, fileTypeHint: nil)
        audioMuestra.prepareToPlay()
        
        print(respuestas)
        //Muestro Resultados en imageViews
        if (respuestas[0] == true) {
            imgP1.image = imgCorrecto
        }
        else
        {
            imgP1.image = imgIncorrecto;
        }
        
        if (respuestas[1] == true) {
            imgP2.image = imgCorrecto
        }
        else
        {
            imgP2.image = imgIncorrecto;
        }
        
        if (respuestas[2] == true) {
            imgP3.image = imgCorrecto
        }
        else
        {
            imgP3.image = imgIncorrecto;
        }
        
        if (respuestas[3] == true) {
            imgP4.image = imgCorrecto
        }
        else
        {
            imgP4.image = imgIncorrecto;
        }
        
        if (respuestas[4] == true) {
            imgP5.image = imgCorrecto
        }
        else
        {
            imgP5.image = imgIncorrecto;
        }
        
        //Muestro Preguntas el Labels
        print(preguntasFinal)
        lblP1.text = preguntasFinal[0]
        lblP2.text = preguntasFinal[1]
        lblP3.text = preguntasFinal[2]
        lblP4.text = preguntasFinal[3]
        lblP5.text = preguntasFinal[4]
        
        
        lblP1.hidden = true
        lblP2.hidden = true
        lblP3.hidden = true
        lblP4.hidden = true
        lblP5.hidden = true
        
        imgP1.hidden = true
        imgP2.hidden = true
        imgP3.hidden = true
        imgP4.hidden = true
        imgP5.hidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(){
        counter += 0.01
        
        print(counter)
        
        if(counter >= 1.0 && counter < 2.0){
            audioMuestra.play()
            imgP1.hidden = false
            lblP1.hidden = false
        }
        else if(counter >= 2.0 && counter < 3.0){
            audioMuestra.play()
            imgP2.hidden = false
            lblP2.hidden = false
        }
        else if(counter >= 3.0 && counter < 4.0){
            audioMuestra.play()
            imgP3.hidden = false
            lblP3.hidden = false
        }
        else if(counter >= 4.0 && counter < 5.0){
            audioMuestra.play()
            imgP4.hidden = false
            lblP4.hidden = false
        }
        else if(counter >= 5.0 && counter < 6.0){
            audioMuestra.play()
            imgP5.hidden = false
            lblP5.hidden = false
        }
        else if (counter >= 6)
        {
            timer.invalidate()
            btnMenu.enabled = true
        }
        
        
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
