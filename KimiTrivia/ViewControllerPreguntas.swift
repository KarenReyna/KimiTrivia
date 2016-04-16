//
//  ViewControllerPreguntas.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 19/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerPreguntas: UIViewController {

    //Preguntas
    var preguntas: NSArray = NSArray()
    
    
    //OUTLETS
    @IBOutlet weak var progressTime: UIProgressView!
    @IBOutlet weak var viewResultados: UIView!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var btnRespuestaA: UIButton!
    @IBOutlet weak var btnRespuestaB: UIButton!
    @IBOutlet weak var btnRespuestaC: UIButton!
    @IBOutlet weak var btnRespuestaD: UIButton!
    @IBOutlet weak var lblPregunta: UILabel!
    
    
    //Sonidos
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    var sonidoCountdown = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("countdown", ofType: "mp3")!)
    var audioCountDown = AVAudioPlayer()
    var sonidoEndOfGame = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("endOfGame", ofType: "mp3")!)
    var audioEndOfGame = AVAudioPlayer()
    
    //Variables de Control
    var titulo: String = ""
    var player: jugador = jugador()
    var nivel: Int = 0
    var timer = NSTimer()
    var counter: Float = 1.0
    var TIEMPO_MAX: Float = 50.0
    
    
    //Variables del cuestionario
    var indexMaxPregunta: Int = 0
    var indexMinPregunta: Int = 0
    var pregContestadas = 0
    var respuestas:[Bool] = [false,false,false,false,false]
    var preguntasFinal:[String] = ["", "", "", "", ""]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        TIEMPO_MAX += 1;    //Timer empieza en 1
        lblTiempo.text = "0:50"
        pregContestadas = 0;
        
        //Timers
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: #selector(ViewControllerPreguntas.updateTimer), userInfo: nil, repeats: true)
        progressTime.progress = 1 - Float(counter)/TIEMPO_MAX
        
        //Sonidos
        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        audioCountDown = try! AVAudioPlayer(contentsOfURL: sonidoCountdown, fileTypeHint: nil)
        audioCountDown.prepareToPlay()
        audioEndOfGame = try! AVAudioPlayer(contentsOfURL: sonidoEndOfGame, fileTypeHint: nil)
        audioEndOfGame.prepareToPlay()
        
        //Preguntas
        if(titulo == "Básico"){
            let path = NSBundle.mainBundle().pathForResource("Basico", ofType: "plist")
            preguntas = NSArray(contentsOfFile: path!)!
        }
        else if(titulo == "Intermedio"){
            let path = NSBundle.mainBundle().pathForResource("Intermedio", ofType: "plist")
            preguntas = NSArray(contentsOfFile: path!)!
        }
        else{
            let path = NSBundle.mainBundle().pathForResource("Avanzado", ofType: "plist")
            preguntas = NSArray(contentsOfFile: path!)!
        }
        
        indexMaxPregunta = (nivel * 5 - 1)
        indexMinPregunta = (nivel * 5 - 5)
        
        cargaPregunta()
        
    }

    func cargaPregunta(){
        let indexPreguntaEnPlist = indexMinPregunta + pregContestadas
        
        //Cargo Pregunta
        lblPregunta.text = String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("Pregunta")!)
        
        //Cargo Respuesta
        if(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("Tipo")!) == "OM"){
            
            btnRespuestaA.hidden = false
            btnRespuestaD.hidden = false
            
            btnRespuestaA.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("A")!), forState: UIControlState.Normal)
            btnRespuestaB.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("B")!), forState: UIControlState.Normal)
            btnRespuestaC.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("C")!), forState: UIControlState.Normal)
            btnRespuestaD.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("D")!), forState: UIControlState.Normal)
            
        }
        else{
            btnRespuestaA.hidden = true
            btnRespuestaD.hidden = true
            
            btnRespuestaB.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("A")!), forState: UIControlState.Normal)
            btnRespuestaC.setTitle(String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("B")!), forState: UIControlState.Normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(){
        counter += 0.01
        progressTime.progress = 1.0 - counter / TIEMPO_MAX
        //print(counter)
        if((TIEMPO_MAX - counter) > 9) {
            lblTiempo.text = "0:" + String(Int(TIEMPO_MAX + 1 - counter))
        }
        else{
            lblTiempo.text = "0:0" + String(Int(TIEMPO_MAX + 1 - counter))
        }
        
        if( (counter >= (TIEMPO_MAX - 10)) && (audioCountDown.playing == false)){
            audioCountDown.play();
        }
        
        
        if(counter >= TIEMPO_MAX || pregContestadas == 5){
            timer.invalidate()
            audioCountDown.stop()
            audioEndOfGame.play()
            //print(counter)
            viewResultados.hidden = false
            btnRespuestaA.hidden = true
            btnRespuestaB.hidden = true
            btnRespuestaC.hidden = true
            btnRespuestaD.hidden = true
            lblPregunta.hidden = true
           
        }
        
    }
    
    @IBAction func respondePregunta(sender: UIButton) {
        audioClick.play()
        
        //Verifico Si respondió Bien y guardo boolean
        
        let indexPreguntaEnPlist = indexMinPregunta + pregContestadas
        
        if(sender.titleLabel?.text == String(preguntas.objectAtIndex(indexPreguntaEnPlist).objectForKey("Correcta")!)){
            respuestas[pregContestadas] = true
        }
        else{
            respuestas[pregContestadas] = false
        }
        preguntasFinal[pregContestadas] = lblPregunta.text!
        
        //print(preguntasFinal)
        //print(respuestas)
        
        pregContestadas += 1;
        
        if(pregContestadas > 5){
            pregContestadas = 5
        }
        if(pregContestadas < 5){
            cargaPregunta()
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "Resultados"){
            let vista = segue.destinationViewController as! ViewControllerFinDelJuego
            vista.respuestas = self.respuestas
            vista.preguntasFinal = self.preguntasFinal
        }
    }
    
    

}
