//
//  ViewController.swift
//  Calendar
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let df = DateFormatter()
    var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        df.dateFormat = "dd/MM/yyyy"
        events = [
            Event.init(withName: "Prova de Inglês", date: df.date(from: "01/05/2018")!, place: "UFC Pici", image: #imageLiteral(resourceName: "placeholder")),
            Event.init(withName: "Rodízio de Pizza", date: df.date(from: "12/05/2018")!, place: "Le Gusto, Jovita", image: #imageLiteral(resourceName: "placeholder")),
            Event(withName: "Encontrinho", date: df.date(from: "02/06/2018")!, place: "Praça do Amor", image: #imageLiteral(resourceName: "placeholder")),
            Event(withName: "Treino de vôlei", date: df.date(from: "09/05/2018")!, place: "Aterro da Praia de Iracema", image: #imageLiteral(resourceName: "placeholder"))]
        
        let nib = UINib(nibName: "EventTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EventCell")
        tableView.dataSource = self
        
        
        //tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        let event = self.events[indexPath.row]
        cell.name.text = event.name
        cell.date.text = event.date.description
        cell.place.text = event.place
        cell.img.image = event.image
        return cell
    }
}
