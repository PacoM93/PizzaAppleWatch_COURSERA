//
//  queso.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 20/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit
import Foundation

class queso: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    
    @IBAction func Eleccion(_ value: Int) {
        respuesta = itemsPickerArray[value].title!
        print(respuesta!)
    }
    
    
    let lista = ["Mozarella","Cheddar","Parmesano","Sin queso"]
    var itemsPickerArray: [WKPickerItem] = []
    var respuestaTamaño: String?
    var respuestaMasa: String?
    var respuesta: String?
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let r = context as! Respuestas
        respuestaMasa = r.masa
        respuestaTamaño = r.tamaño
        //respuestaContexto = context as! Respuestas
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
        let respuestaContexto = Respuestas(t:respuestaTamaño!,m:respuestaMasa!,q:respuesta!,i:[])
        pushController(withName: "idIngredientes", context: respuestaContexto)
    }
}
