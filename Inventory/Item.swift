//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class Item{
    var name: String
    var SKU: String
    var description: String
    var dateAdded: Date
    
    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.description = description
        self.dateAdded = dateAdded
    }
}
