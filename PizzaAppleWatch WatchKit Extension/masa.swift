//
//  masa.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 20/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit
import Foundation

class masa: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    
    @IBAction func Eleccion(_ value: Int) {
        respuesta = itemsPickerArray[value].title!
        print(respuesta!)
    }
    
    
    let lista = ["Delgada","Crujuente","Gruesa"]
    var itemsPickerArray: [WKPickerItem] = []
    var respuestasTamaño :String?
    var respuesta : String?
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let r = context as! Respuestas
        respuestasTamaño = r.tamaño
        //respuestaContexto=context as! Respuestas
        // Configure interface objects here.
        
        for item in lista{
            let itemPicker = WKPickerItem()
            itemPicker.title = item
            itemsPickerArray.append(itemPicker)
        }
        picker.setItems(itemsPickerArray)
        respuesta = itemsPickerArray[0].title!
        print(respuesta!)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func Siguiente() {
        let respuestaContexto = Respuestas(t:respuestasTamaño!,m:respuesta!,q:"",i:[])
        pushController(withName: "idQueso", context: respuestaContexto)
    }
    
}
