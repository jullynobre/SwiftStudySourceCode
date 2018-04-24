//
//  ViewController.swift
//  Contacts
//
//  Created by Ada 2018 on 24/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = [Contact.init(name: "Adauto", phone: "928129819"),
                               Contact.init(name: "Daniel", phone: "928129819"),
                               Contact.init(name: "Palhares", phone: "928129819"),
                               Contact.init(name: "Levy", phone: "928129819"),
                               Contact.init(name: "Jully", phone: "928188719")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath) as? ContactTableViewCell else{
            fatalError("The dequeued cell is not an instance of ContactTableViewCell.")
        }
        
        let contact = self.contacts[indexPath.row]
        
        cell.name.text = contact.name
        cell.phone.text = contact.phone
        cell.imageView?.image = contact.image
        
        return cell
    }
}
