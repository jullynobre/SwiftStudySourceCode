//
//  ViewController1.swift
//  TableViewCellWithXib
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dogs: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogs = [Pet.init(withName: "Dog Estiloso", shortDescription: "Doguinho com muito estilo", image: #imageLiteral(resourceName: "dog1")),
                Pet.init(withName: "Presa canário", shortDescription: "Doguinho fofo demais", image: #imageLiteral(resourceName: "dog2")),
                Pet.init(withName: "Mimi", shortDescription: "Mimi, não toque nele", image: #imageLiteral(resourceName: "dog3")),
                Pet.init(withName: "Daniel", shortDescription: "hehehehe gato zuero", image: #imageLiteral(resourceName: "dog4")),
                Pet.init(withName: "Lobiho", shortDescription: "Doguinho do Celbit", image: #imageLiteral(resourceName: "dog5"))]
        
        let nib = UINib.init(nibName: "PetTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "PetCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController1: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath) as! PetTableViewCell
        
        let dog = self.dogs[indexPath.row]
        
        cell.petName.text = dog.name
        cell.petShortDescription.text = dog.shortDescription
        cell.petImage.image = dog.image
        
        return cell
    }
}

extension ViewController1: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let title = NSLocalizedString("Delete Doguinho", comment: "Delete Doguinho")
        
        let action = UIContextualAction(style: .normal, title: title,
                                        handler: { (action, view, completionHandler) in
                                            print("Delete: \(indexPath.row)")
                                            completionHandler(true)
        })
        
        action.image = #imageLiteral(resourceName: "trashIcon")
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        
        return configuration
    }    
}




