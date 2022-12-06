//
//  Prodotti.swift
//  Ebay
//
//  Created by giovanni russo on 16/11/22.
//

import SwiftUI
import Foundation

struct Prodotti : Codable, Identifiable{
    
    var id: Int
    var title : String
    var subtitle: String
    var Immagine : String
    var categoria : String
    var price : Double
    var starred : Bool
}

var listaProdotti = [Prodotti(id: 1, title: "Alarm Clock", subtitle: "New | Ebay", Immagine: "1",
 categoria: "Electronics", price: 5.55, starred: false),
                 Prodotti(id: 2, title: "Universal Charger",  subtitle: "New | Monclick", Immagine: "2", categoria: "Electronics", price: 15.55, starred: false),
                 Prodotti(id: 3, title: "Floor Lamp", subtitle: "New | Lamp_shop", Immagine: "3", categoria: "Lamps", price: 60.55, starred: false),
                 Prodotti(id: 4, title: "Tablet Android 128 GB", subtitle: "New | TPlanet", Immagine: "4", categoria: "Tablet", price: 50.55, starred: false),
                 Prodotti(id: 5, title: "Iphone 14 Cover", subtitle: "New | CoverLand", Immagine: "5", categoria: "Smartphone", price: 9.55, starred: false)
]
