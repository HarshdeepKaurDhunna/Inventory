//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class Item NSObject, NSCoding {

    func encode(with coder: NSCoder) {
        coder.encode(name,forKey: "name")
        coder.encode(SKU,forKey: "SKU")
        coder.encode(desc,forKey: "desc")
        coder.encode(dateAdded,forKey: "dateAdded")
    }

    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = coder.decodeObject(forKey: "name") as! String
        self.SKU = coder.decodeObject(forKey: "SKU") as! String
        self.desc = coder.decodeObject(forKey: "desc") as! String
        self.dateAdded = coder.decodeObject(forKey: "dateAdded") as! Date
    }
    
    let name: String
    let SKU: String
    let desc: String
    let dateAdded: Date
    
    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.desc = description
        self.dateAdded = dateAdded
    }
}


