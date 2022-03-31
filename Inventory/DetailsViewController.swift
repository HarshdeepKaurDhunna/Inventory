//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    var itemInventory: ItemList!
    var selectedItem: Int?
    
    var userVal: UserDefaults!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         //Set Data to items and validate
        if(nil != selectedItem){
            let inventoryVal = itemInventory.items[selectedItem!]
            nameField.text = inventoryVal.name
            SKUField.text = inventoryVal.SKU
            descField.text = inventoryVal.desc
            dateField.date = inventoryVal.dateAdded
        }
        
    }
    
    //This method is to save or update data
    @IBAction func save(_ sender: Any) {
    let val = Item(name: nameField.text!,SKU: SKUField.text!,description: descField.text!, dateAdded: dateField.date)
    if(nil != index) {
        itemInventory.items.remove(at: index!)
        itemInventory.items.insert(val, at: index!)

    }else {
        itemInventory.addItem(item: val)
    }
        do {
            
            let itemEncodedVal = try NSKeyedArchiver.archivedData(withRootObject: itemInventory.items, requiringSecureCoding:false)
            userVal.set(itemEncodedVal, forKey: "inventory")
        } catch  {}
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
