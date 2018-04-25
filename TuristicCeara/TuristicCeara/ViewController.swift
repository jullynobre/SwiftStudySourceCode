//
//  ViewController.swift
//  TuristicCeara
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = [Place.init(withName: "Canoa Quebrada", image: #imageLiteral(resourceName: "canoa_quebrada_preview")),
                  Place.init(withName: "Beach Park", image: #imageLiteral(resourceName: "beach_park_preview")),
                  Place.init(withName: "Beira Mar", image: #imageLiteral(resourceName: "beira_bar_preview")),
                  Place.init(withName: "IFCE", image: nil)]
        
        tableVIew.separatorStyle = .none
        
        tableVIew.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as? PlaceTableViewCell else{
            fatalError("The dequeued cell is not an instance of ContactTableViewCell.")
        }
        
        let place = places[indexPath.row]
        
        cell.placeName.text = place.name
        cell.placeImage.image = place.image
        
        return cell
    }
}
