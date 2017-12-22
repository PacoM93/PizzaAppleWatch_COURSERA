//
//  Datos.swift
//  PizzaAppleWatch WatchKit Extension
//
//  Created by Francisco Montes Fonseca on 20/12/17.
//  Copyright © 2017 COURSERA. All rights reserved.
//

import WatchKit

class Respuestas: NSObject {
    var tamaño: String = ""
    var masa: String = ""
    var queso: String = ""
    var ingredientes: [String] = []
    
    init(t: String, m: String, q:String, i: [String]) {
        tamaño = t
        masa = m
        queso = q
        ingredientes = i
    }
}
