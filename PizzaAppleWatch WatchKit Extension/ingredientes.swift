//
//  ingredientes.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 20/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit
import Foundation

class ingredientes: WKInterfaceController {
    var respuestaTamaño: String?
    var respuestaMasa: String?
    var respuestaQueso: String?
    var respuesta: [String] = []
    
    @IBOutlet var Jamon: WKInterfaceSwitch!
    @IBOutlet var Aceitunas: WKInterfaceSwitch!
    @IBOutlet var Anchoa: WKInterfaceSwitch!
    @IBOutlet var Pepperoni: WKInterfaceSwitch!
    @IBOutlet var Pavo: WKInterfaceSwitch!
    @IBOutlet var Salchicha: WKInterfaceSwitch!
    @IBOutlet var Cebolla: WKInterfaceSwitch!
    @IBOutlet var Chile: WKInterfaceSwitch!
    @IBOutlet var Pimiento: WKInterfaceSwitch!
    @IBOutlet var Carne: WKInterfaceSwitch!
    @IBOutlet var Piña: WKInterfaceSwitch!
    
    func eleccion(value:Bool,ingrediente:String){
        if (value && respuesta.count<5){
            respuesta.append(ingrediente)
            if respuesta.count==5{
                Jamon.setEnabled(false)
                Aceitunas.setEnabled(false)
                Anchoa.setEnabled(false)
                Pepperoni.setEnabled(false)
                Pavo.setEnabled(false)
                Salchicha.setEnabled(false)
                Cebolla.setEnabled(false)
                Chile.setEnabled(false)
                Pimiento.setEnabled(false)
                Carne.setEnabled(false)
                Piña.setEnabled(false)
            }
        }else{
            respuesta = respuesta.filter(){$0 != ingrediente}
            
        }
    }
    
    @IBAction func Reiniciar() {
        ReiniciarSwitch()
    }
    
    func ReiniciarSwitch(){
        Jamon.setEnabled(true)
        Aceitunas.setEnabled(true)
        Anchoa.setEnabled(true)
        Pepperoni.setEnabled(true)
        Pavo.setEnabled(true)
        Salchicha.setEnabled(true)
        Cebolla.setEnabled(true)
        Chile.setEnabled(true)
        Pimiento.setEnabled(true)
        Carne.setEnabled(true)
        Piña.setEnabled(true)
        Jamon.setOn(false)
        Aceitunas.setOn(false)
        Anchoa.setOn(false)
        Pepperoni.setOn(false)
        Pavo.setOn(false)
        Salchicha.setOn(false)
        Cebolla.setOn(false)
        Chile.setOn(false)
        Pimiento.setOn(false)
        Carne.setOn(false)
        Piña.setOn(false)
        respuesta = []
    }

    
    @IBAction func Jamon(_ value: Bool) {
        eleccion(value: value, ingrediente: "Jamón")
    }
    
    
    @IBAction func Aceitunas(_ value: Bool) {
       eleccion(value: value, ingrediente: "Aceitunas")
    }
    
    
    
    @IBAction func Anchoa(_ value: Bool) {
        eleccion(value: value, ingrediente: "Anchoa")
    }
    
    
    @IBAction func Pepperoni(_ value: Bool) {
        eleccion(value: value, ingrediente: "Pepperoni")
    }
    
    
    @IBAction func Pavo(_ value: Bool) {
        eleccion(value: value, ingrediente: "Pavo")
    }
    
    
    @IBAction func Salchicha(_ value: Bool) {
        eleccion(value: value, ingrediente: "Salchicha")
    }
    
    
    @IBAction func Cebolla(_ value: Bool) {
        eleccion(value: value, ingrediente: "Cebolla")
    }
    
    
    @IBAction func Chile(_ value: Bool) {
        eleccion(value: value, ingrediente: "Chile")
    }
    
    
    @IBAction func Pimiento(_ value: Bool) {
        eleccion(value: value, ingrediente: "Pimiento")
    }
    
    
    @IBAction func Carne(_ value: Bool) {
        eleccion(value: value, ingrediente: "Carne")
    }
    
    @IBAction func Piña(_ value: Bool) {
        eleccion(value: value, ingrediente: "Piña")
    }
    
    
    
    @IBAction func prueba() {
        let respuestaContexto = Respuestas(t:respuestaTamaño!,m:respuestaMasa!,q:respuestaQueso!,i:respuesta)
        print(respuestaContexto.ingredientes)
        print(respuestaContexto.masa)
        print(respuestaContexto.queso)
        print(respuestaContexto.tamaño)
        
        let Regresar = WKAlertAction(title: "Regresar", style: WKAlertActionStyle.cancel, handler: { () -> Void in
        })
        
        if respuesta == []{
            presentAlert(withTitle: "¡ALERTA!", message: "\nElige un \n ingrediente", preferredStyle: .alert, actions: [Regresar])
        }else{
            print("Ingrediente seleccionado")
            pushController(withName: "idConfirmar", context: respuestaContexto)
        }
        
        
        
        
        
    }
    
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let r = context as! Respuestas
        respuestaTamaño = r.tamaño
        respuestaMasa = r.masa
        respuestaQueso = r.queso
        //respuestaContexto=context as! Respuestas
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        ReiniciarSwitch()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
