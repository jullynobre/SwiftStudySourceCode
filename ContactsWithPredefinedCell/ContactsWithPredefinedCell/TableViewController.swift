//
//  TableViewController.swift
//  ContactsWithPredefinedCell
//
//  Created by Ada 2018 on 24/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contacts = [Contact.init(name: "João", phone: "998987665"),
                    Contact.init(name: "Maria Antônieta", phone: "998987665"),
                    Contact.init(name: "Jozé Maria", phone: "998987665"),
                    Contact.init(name: "Antônio", phone: "998987665"),
                    Contact.init(name: "Antônio", phone: "998987665"),
                    Contact.init(name: "Francisco", phone: "998987665"),
                    Contact.init(name: "Antônia", phone: "998987665"),
                    Contact.init(name: "Madalena", phone: "998987665"),
                    Contact.init(name: "Sharon", phone: "998987665"),
                    Contact.init(name: "João", phone: "998987665"),
                    Contact.init(name: "Maria Antônieta", phone: "998987665"),
                    Contact.init(name: "Jozé Maria", phone: "998987665"),
                    Contact.init(name: "Antônio", phone: "998987665"),
                    Contact.init(name: "Antônio", phone: "998987665"),
                    Contact.init(name: "Francisco", phone: "998987665"),
                    Contact.init(name: "Antônia", phone: "998987665"),
                    Contact.init(name: "Madalena", phone: "998987665"),
                    Contact.init(name: "Sharon", phone: "998987665")]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phone
        cell.imageView?.image = contact.image
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        
        let alert = UIAlertController(title: contact.name, message: contact.phone, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
