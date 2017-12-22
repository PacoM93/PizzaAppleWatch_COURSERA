//
//  tamaño.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 20/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit
import Foundation

class taman_o: WKInterfaceController {
    let lista = ["Grande","Mediano","Chico"]
    var itemsPickerArray: [WKPickerItem] = []
    var respuesta: String?
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        
        for item in lista{
            let itemPicker = WKPickerItem()
            itemPicker.title = item
            itemsPickerArray.append(itemPicker)
        }
        picker.setItems(itemsPickerArray)
        respuesta=itemsPickerArray[0].title!
        print(respuesta!)
    }
    
    @IBAction func Eleccion(_ value: Int) {
        respuesta = itemsPickerArray[value].title!
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
        let respuestaContexto = Respuestas(t:respuesta!,m:"",q:"",i:[])
        pushController(withName: "idMasa", context: respuestaContexto)

    }
    
    
    
    
}
