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
    var puntos: Int = 0
    
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    
    //BotonesNiveles
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNivel.text = titulo

        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        
        cargarPuntos()

    }

    @IBAction func botonSonido(sender: AnyObject){
       audioClick.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        cargarPuntos()
    }
    
    override func viewWillAppear(animated: Bool) {
        cargarPuntos()
    }
    
    @IBAction func unwindNiveles(sender: UIStoryboardSegue) {
        print("Llega unwind")
        cargarPuntos()
        print("pasa cargaPuntos")
    }
    
    func cargarPuntos(){
        //var puntosArr: NSArray = NSArray()
        //let path = NSBundle.mainBundle().pathForResource("usuario", ofType: "plist")
        let fileName = "/usuario.plist"
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath: String = documentsDirectory.stringByAppendingString(fileName)
        var puntosArr: NSMutableArray = NSMutableArray()
        //let path = NSBundle.mainBundle().pathForResource("usuario", ofType: "plist")
        puntosArr = NSMutableArray(contentsOfFile: filePath)!

        
        player.puntosBasico = Int(puntosArr.objectAtIndex(0).objectForKey("puntosBasico")! as! NSNumber)
        player.puntosIntermedio = Int(puntosArr.objectAtIndex(0).objectForKey("puntosIntermedio")! as! NSNumber)
        player.puntosAvanzado = Int(puntosArr.objectAtIndex(0).objectForKey("puntosAvanzado")! as! NSNumber)
        
        
        if(titulo == "Básico"){
            puntos = player.puntosBasico
        }
        else if (titulo == "Intermedio"){
            puntos = player.puntosIntermedio
        }
        else if(titulo == "Avanzado"){
            puntos = player.puntosAvanzado
        }
        
        if(puntos >= 5){
            btn2.enabled = true
        }
        if(puntos >= 10){
            btn3.enabled = true
        }
        if(puntos >= 15){
            btn4.enabled = true
        }
        if(puntos >= 20){
            btn5.enabled = true
        }
        
        //Prints
        print(titulo)
        print("Puntos Básico: " + String(player.puntosBasico))
        print("Puntos Intermedio: " + String(player.puntosIntermedio))
        print("Puntos Avanzado: " + String(player.puntosAvanzado))
        print("")
        
        
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
