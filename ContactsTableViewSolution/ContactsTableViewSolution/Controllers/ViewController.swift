//
//  ViewController.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = [Contact.init(WithName: "Débora Moura", phone: "998768976", photo: nil),
                    Contact.init(WithName: "Daniel Alves", phone: "762398238", photo: nil),
                    Contact.init(WithName: "Barbosa Silva", phone: "087654356", photo: nil)]
        
        let nib = UINib.init(nibName: "ContactTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ContactCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell)

        
        let contact = contacts[indexPath.row]
        
        cell.contactImage.image = contact.photo
        cell.contactName.text = contact.name
        cell.contactPhone.text = contact.phone
        
        return cell
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "",
            handler: {
                (action, view, completionHandler) in
                
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
                
                    completionHandler(true)
            })
        
        action.image = #imageLiteral(resourceName: "trashIcon")
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        
        return configuration
    }
}
