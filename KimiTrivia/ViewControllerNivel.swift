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

    var lecturas: NSArray = NSArray()
    
    @IBOutlet weak var lblNivel: UILabel!
    var titulo: String = "aaa"
    var player: jugador = jugador()
    var puntos: Int = 0
    
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    
    //Outlets
    @IBOutlet weak var lblContenido: UILabel!
    @IBOutlet weak var vistaLectura: UIView!
    @IBOutlet weak var textoLectura: UITextView!
    
    
    //BotonesNiveles
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    //Botones Lecturas
    @IBOutlet weak var btnL1: UIButton!
    @IBOutlet weak var btnL2: UIButton!
    @IBOutlet weak var btnL3: UIButton!
    @IBOutlet weak var btnL4: UIButton!
    @IBOutlet weak var btnL5: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNivel.text = titulo

        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        
        //Preguntas
        if(titulo == "Básico"){
            let path = NSBundle.mainBundle().pathForResource("BasicoTextos", ofType: "plist")
            lecturas = NSArray(contentsOfFile: path!)!
        }
        else if(titulo == "Intermedio"){
            let path = NSBundle.mainBundle().pathForResource("IntermedioTextos", ofType: "plist")
            lecturas = NSArray(contentsOfFile: path!)!
        }
        else{
            let path = NSBundle.mainBundle().pathForResource("AvanzadoTextos", ofType: "plist")
            lecturas = NSArray(contentsOfFile: path!)!
        }
        
        cargarPuntos()

    }
    
    @IBAction func ocultarLectura(sender: AnyObject) {
        vistaLectura.hidden = true
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
            lblContenido.text = "Historia de la Química Fragante"
        }
        else if (titulo == "Intermedio"){
            puntos = player.puntosIntermedio
            lblContenido.text = "Mezclas"
        }
        else if(titulo == "Avanzado"){
            puntos = player.puntosAvanzado
            lblContenido.text = "Soluciones"
        }
        
        if(puntos >= 5){
            btn2.enabled = true
            if(String(lecturas.objectAtIndex(1).objectForKey("Texto")!) != ""){
                btnL2.enabled = true
                btnL2.hidden = false
            }
            else{
                btnL2.hidden = true
            }
        }
        else{
            btnL2.hidden = true
        }
        if(puntos >= 10){
            btn3.enabled = true
            if(String(lecturas.objectAtIndex(2).objectForKey("Texto")!) != ""){
                btnL3.enabled = true
                btnL3.hidden = false
            }
            else{
                btnL3.hidden = true
            }
        }
        else{
            btnL3.hidden = true
        }
        if(puntos >= 15){
            btn4.enabled = true
            if(String(lecturas.objectAtIndex(3).objectForKey("Texto")!) != ""){
                btnL4.enabled = true
                btnL4.hidden = false
            }
            else{
                btnL4.hidden = true
            }
        }
        else{
            btnL4.hidden = true
        }
        if(puntos >= 20){
            btn5.enabled = true
            if(String(lecturas.objectAtIndex(4).objectForKey("Texto")!) != ""){
                btnL5.enabled = true
                btnL5.hidden = false
            }
            else{
                btnL5.hidden = true
            }
        }
        else{
            btnL5.hidden = true
        }
        
        //Prints
        print(titulo)
        print("Puntos Básico: " + String(player.puntosBasico))
        print("Puntos Intermedio: " + String(player.puntosIntermedio))
        print("Puntos Avanzado: " + String(player.puntosAvanzado))
        print("")
        
        
    }
    
   
    @IBAction func mostrarLectura(sender: UIButton) {
        
        if(sender == btnL1){
            textoLectura.text = String(lecturas.objectAtIndex(0).objectForKey("Texto")!)
        }
        else if(sender == btnL2){
            textoLectura.text = String(lecturas.objectAtIndex(1).objectForKey("Texto")!)
        }
        else if(sender == btnL3){
            textoLectura.text = String(lecturas.objectAtIndex(2).objectForKey("Texto")!)
        }
        else if(sender == btnL4){
            textoLectura.text = String(lecturas.objectAtIndex(3).objectForKey("Texto")!)
        }
        else if(sender == btnL5){
            textoLectura.text = String(lecturas.objectAtIndex(4).objectForKey("Texto")!)
        }
        
        vistaLectura.hidden = false
        
        
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
