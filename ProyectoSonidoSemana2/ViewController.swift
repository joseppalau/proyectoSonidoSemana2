//
//  ViewController.swift
//  ProyectoSonidoSemana2
//
//  Created by Josep Palau Caballero on 11/01/2018.
//  Copyright © 2018 Palau Innova. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var cancion: AVAudioPlayer!
    var imagen: UIImage!
    var tituloCancion: String = ""
    
    
    @IBOutlet weak var tituloCancionLbl: UILabel!
    @IBOutlet weak var imagenView: UIImageView!
   
    @IBOutlet weak var volumen: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagenView.image = imagen
        tituloCancionLbl.text = tituloCancion
        play()
    
    }
    
    @IBAction func play() {
        
        if !cancion.isPlaying {
            cancion.play()
        }
    }
    
    @IBAction func pause(){
        
        if cancion.isPlaying {
            cancion.pause()
        }
    }
    
    @IBAction func stop() {
        
        if !cancion.isPlaying || cancion.isPlaying {
            cancion.stop()
            cancion.currentTime = 0.0
            
        }
    
    }
    
    @IBAction func controlVolumen(_ sender: UISlider) {
        
        cancion.volume = volumen.value
    }
    
    
}
