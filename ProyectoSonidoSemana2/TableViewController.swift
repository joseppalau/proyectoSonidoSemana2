//
//  TableViewController.swift
//  ProyectoSonidoSemana2
//
//  Created by Josep Palau Caballero on 12/01/2018.
//  Copyright © 2018 Palau Innova. All rights reserved.
//

import UIKit
import AVFoundation

class Canciones {
    
    var tituloCancion: String = ""
    var imagenPortada: UIImage?
    var cancion: AVAudioPlayer?
    
    init(tituloCancion: String, imagenPortada: UIImage, cancion: AVAudioPlayer) {
        self.tituloCancion = tituloCancion
        self.imagenPortada = imagenPortada
        self.cancion = cancion
    }
    
}

class TableViewController: UITableViewController {
    

    var titulosCancion = ["Que Yo No Lo Sabía","What a Wonderful World","I'm Your Man","Prefiero el Trapecio","Over the Rainbow","Tonada De Luna Llena","All You Need Is Love"]
    
    var imagenesPortada:  [UIImage] = [#imageLiteral(resourceName: "Elefantes.png"),#imageLiteral(resourceName: "Luis-Amstrong.png"),#imageLiteral(resourceName: "M.Buble.png"),#imageLiteral(resourceName: "Manolo-garcia.png"),#imageLiteral(resourceName: "rainbow.png"),#imageLiteral(resourceName: "Silvia-perez-cruz.png"),#imageLiteral(resourceName: "the beattles.png")]
    var archivoCancion = [AVAudioPlayer]()
    var listadoCanciones = [Canciones]()
    
    private var song: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lista Canciones"
        
        for i in 0...6 {
            
            let songURL = Bundle.main.url(forResource: titulosCancion[i], withExtension: "m4a")
            
            do {
                try song = AVAudioPlayer(contentsOf: songURL!)
                
            }
                
            catch{
                print("error al cargar canción")
            }
            
            archivoCancion.append(song)
            
            let cancion = Canciones(tituloCancion:  titulosCancion[i], imagenPortada: imagenesPortada[i], cancion: archivoCancion[i])
            
            self.listadoCanciones.append(cancion)
            
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (listadoCanciones.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = self.listadoCanciones[indexPath.row].tituloCancion
        cell.imageView?.image = self.imagenesPortada[indexPath.row]
       
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "aleatorio" {
            
            let a:UInt32 = arc4random_uniform(6)
            let b = Int(a)
            let cc = segue.destination as! ViewController
            cc.cancion = self.listadoCanciones[b].cancion
            cc.imagen = self.listadoCanciones [b].imagenPortada
            cc.tituloCancion = self.listadoCanciones[b].tituloCancion
        }
        
        else {
        let cc = segue.destination as! ViewController
        
        let ip = self.tableView.indexPathForSelectedRow
        cc.cancion = self.listadoCanciones[ip!.row].cancion
        cc.imagen = self.listadoCanciones [ip!.row].imagenPortada
        cc.tituloCancion = self.listadoCanciones[ip!.row].tituloCancion
        }
    
    }
    
}
