//
//  ViewController.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 18/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: jugador = jugador()
    
    var sonidoClick = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var audioClick = AVAudioPlayer()
    var ThemePlayer = AVAudioPlayer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        audioClick = try! AVAudioPlayer(contentsOfURL: sonidoClick, fileTypeHint: nil)
        audioClick.prepareToPlay()
        ThemeSound()
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.stopMusic), name: UIApplicationDidEnterBackgroundNotification, object: app)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.playMusic), name: UIApplicationDidBecomeActiveNotification, object: app)
        
        
        //crear archivo de puntos de usuario
        let fileName = "/usuario.plist"
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath: String = documentsDirectory.stringByAppendingString(fileName)
        let checkValidation = NSFileManager.defaultManager()
        
        if(!checkValidation.fileExistsAtPath(filePath)){
            var puntosArr: NSArray = NSArray()
            let path = NSBundle.mainBundle().pathForResource("usuario", ofType: "plist")
            puntosArr = NSArray(contentsOfFile: path!)!
            puntosArr.writeToFile(filePath, atomically: true)
            print("Archivo de puntos de usuario creado.")
        }
        else{
            print("Ya existe el archivo.")
        }
        
        
    }
    
    func stopMusic(){
        ThemePlayer.stop()
    }
    func playMusic(){
        ThemePlayer.play()
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        
        if(segue.identifier == "basico"){
            audioClick.play()
            let view: ViewControllerNivel = segue.destinationViewController as! ViewControllerNivel
            view.titulo = "Básico"
            view.player = self.player
        }
        else if(segue.identifier == "intermedio"){audioClick.play()
            let view: ViewControllerNivel = segue.destinationViewController as! ViewControllerNivel
            view.titulo = "Intermedio"
            view.player = self.player
        }
        else if (segue.identifier == "avanzado"){
            audioClick.play()
            let view: ViewControllerNivel = segue.destinationViewController as! ViewControllerNivel
            view.titulo = "Avanzado"
            view.player = self.player
        }
        
    }
    
    // Pantalla de niveles
    @IBAction func unwindNiveles(sender: UIStoryboardSegue) {
        
    }
    
    func ThemeSound() {
        if let path = NSBundle.mainBundle().pathForResource("Blue_Skies", ofType: "mp3") {
            let enemy1sound = NSURL(fileURLWithPath:path)
            ThemePlayer = try! AVAudioPlayer(contentsOfURL: enemy1sound, fileTypeHint: nil)
            ThemePlayer.numberOfLoops = -1
            ThemePlayer.prepareToPlay()
            ThemePlayer.play()
        }
    }

}

