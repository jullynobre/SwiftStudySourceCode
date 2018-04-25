//
//  ViewController2.swift
//  TableViewCellWithXib
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cats: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cats = [Pet.init(withName: "Lynce", shortDescription: "Muito parecido com um lince", image: #imageLiteral(resourceName: "cat1")),
                Pet.init(withName: "Miah", shortDescription: "Gatinha falecida da Débora", image: #imageLiteral(resourceName: "cat2")),
                Pet.init(withName: "Mimi", shortDescription: "Mimi, não toque nele", image: #imageLiteral(resourceName: "cat3")),
                Pet.init(withName: "Daniel", shortDescription: "hehehehe gato zuero", image: #imageLiteral(resourceName: "cat4")),
                Pet.init(withName: "B-Jota", shortDescription: "Gato da Jully", image: #imageLiteral(resourceName: "cat5"))]
        
        let nib = UINib.init(nibName: "PetTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "PetCell")
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController2: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath) as! PetTableViewCell
        
        let cat = self.cats[indexPath.row]
        
        cell.petName.text = cat.name
        cell.petShortDescription.text = cat.shortDescription
        cell.petImage.image = cat.image
        
        return cell
    }
}
