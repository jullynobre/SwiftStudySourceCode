//
//  ContactsTableViewController.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit
import CoreData

class ContactsTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contacts: [Contact] = []
        /*[Contact.init(WithName: "Débora Moura", phone: "998768976", photo: nil),
         Contact.init(WithName: "Daniel Alves", phone: "762398238", photo: nil),
         Contact.init(WithName: "Barbosa Silva", phone: "087654356", photo: nil)]
         */
    override func viewWillAppear(_ animated: Bool) {
        getData()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "ContactTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ContactCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell)
        
        let contact = contacts[indexPath.row]
        
        cell.contactImage.image = #imageLiteral(resourceName: "contact-avatar")
        cell.contactName.text = contact.name
        cell.contactPhone.text = contact.phone
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let alertDelete = UIAlertController(title: "Delete Contact", message: "Do you really want to delete the contact of \(self.contacts[indexPath.row].name)?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
            { (action) -> Void in
                
                self.contacts.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
                
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alertDelete.addAction(deleteAction)
            alertDelete.addAction(cancelAction)
            
            self.present(alertDelete, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.contacts[sourceIndexPath.row]
        contacts.remove(at: sourceIndexPath.row)
        contacts.insert(movedObject, at: destinationIndexPath.row)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddContactViewController {
            let vc = segue.destination as? AddContactViewController
            vc?.del  = self
        }
    }
    
    func getData() {
        self.contacts = []
        
        let contactsFetch = NSFetchRequest<NSManagedObject>(entityName: "ContactEntity")
        do {
            let requestResult = try context.fetch(contactsFetch)
            
            for result in requestResult{
                let contact = Contact.init(WithName: result.value(forKey: "name") as! String, phone: result.value(forKey: "phone") as! String, photo: nil)
                contacts.append(contact)
            }
        } catch {
            print("Fetching Failed")
        }
    }

}

extension ContactsTableViewController: contactProtocol {
    func addContact(_ contact: Contact) {
        contacts.append(contact)
        self.tableView.reloadData()
    }
}
