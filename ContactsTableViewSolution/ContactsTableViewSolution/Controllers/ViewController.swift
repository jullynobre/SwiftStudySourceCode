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

}
