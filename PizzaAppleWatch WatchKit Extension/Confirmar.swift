//
//  Confirmar.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 21/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit
import Foundation

class Confirmar: WKInterfaceController {
    var respuestaTamaño: String?
    var respuestaMasa: String?
    var respuestaQueso: String?
    var respuestaIngredientes: [String] = []
    var itemsPickerArray: [WKPickerItem] = []
    @IBOutlet var picker: WKInterfacePicker!
    @IBOutlet var Conf: WKInterfaceLabel!
    
    @IBOutlet var Boton: WKInterfaceButton!
    var bandera = 0
    
    @IBOutlet var No: WKInterfaceButton!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let r = context as! Respuestas
        respuestaTamaño = r.tamaño
        respuestaMasa = r.masa
        respuestaQueso = r.queso
        respuestaIngredientes = r.ingredientes
        
        let itemPickerTamaño = WKPickerItem()
        itemPickerTamaño.title = respuestaTamaño!
        itemPickerTamaño.caption = "Tamaño:"
        itemsPickerArray.append(itemPickerTamaño)
        let itemPickerMasa = WKPickerItem()
        itemPickerMasa.title = respuestaMasa!
        itemPickerMasa.caption = "Masa:"
        itemsPickerArray.append(itemPickerMasa)
        let itemPickerQueso = WKPickerItem()
        itemPickerQueso.title = respuestaQueso!
        itemPickerQueso.caption = "Queso:"
        itemsPickerArray.append(itemPickerQueso)
        
        for item in respuestaIngredientes{
            let itemPicker = WKPickerItem()
            itemPicker.title = item
            itemPicker.caption = "Ingredientes:"
            itemsPickerArray.append(itemPicker)
        }
        picker.setItems(itemsPickerArray)
        
        //respuestaContexto=context as! Respuestas
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func confirmar() {
        let Inicio = WKAlertAction(title: "Volver", style: WKAlertActionStyle.default, handler: { () -> Void in
        })
        let respuestaContexto = Respuestas(t:"",m:"",q:"",i:[])
        if bandera == 0{
            presentAlert(withTitle: "¡GRACIAS!", message: "\nTu pedido\nesta en\ncamino", preferredStyle: .alert, actions: [Inicio])
            bandera=1
            Boton.setTitle("Inicio")
            No.setEnabled(false)
            Conf.setText("¡Confirmado!")
        }else{
            pushController(withName: "idInicio", context: respuestaContexto)
        }
    
    }
    
}
