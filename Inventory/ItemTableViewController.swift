//
//  ItemTableViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class ItemTableViewController: UITableViewController {

    let itemInventory = ItemList()
    var selectedItem:Int?
    
    var userVal = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem

        do {
            if let itemVals = userVal.object(forKey: "inventory") {
                let itemDecodedVal = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as? [Item]
                itemInventory.items = decodedItems!
            }
        } catch  {}
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemInventory.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)

        //Show the name of item
        let itemName = inventory.items[indexPath.row]
        cell.textLabel?.text = itemName.name

        return cell

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Row delete from source
            itemInventory.deleteItem(row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            userDefaultsUpdate()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        itemInventory.moveItem(from: fromIndexPath.row, to: to.row)
        userDefaultsUpdate()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let outputVal = segue.destination as! DetailsViewController
        
        outputVal.inventory = itemInventory;
        outputVal.userVal =  userDefaults;
        
        if(segue.identifier == "edit"){
            let rowVal: UITableViewCell = sender as! UITableViewCell
            outputVal.index = tableView.indexPath(for: rowVal)?.row
        }
        
    }

     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func userDefaultsUpdate{
        do {
            
            let itemEncodedVal = try NSKeyedArchiver.archivedData(withRootObject: inventory.items, requiringSecureCoding:false)
            userVal.set(itemEncodedVal, forKey: "inventory")
        } catch  {}
    }
}
