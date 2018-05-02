//
//  ViewController.swift
//  AppLifeCycleTimer
//
//  Created by Ada 2018 on 02/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit
import CoreMedia

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    var counter: TimeInterval = 0.0
    var timer = Timer()
    
    var functionsCalled : [Function] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        timeLabel.text = String(counter)
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func getTimerBtn(_ sender: Any) {
        print(getTimer())
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        timer.invalidate()
        counter = 0.0
        timeLabel.text = getTimer()
    }
    
    @objc func UpdateTimer() {
        counter = counter + 1
        timeLabel.text! = getTimer()
    }
    
    func getTimer() -> String{
        let hours = counter / 3600
        let minutes = Int(floor(counter / 60))
        let seconds = Int(counter) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func addFunction(_ name: String) {
        let f = Function(name: name, time: getTimer())
        functionsCalled.append(f)
        print(functionsCalled[0].name)
        print(functionsCalled[0].time)
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functionsCalled.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FunctionCalledCell", for: indexPath) as! FunctionCalledCell
        
        let function = self.functionsCalled[indexPath.row]
        
        cell.functionName.text = function.name
        cell.functionTime.text = function.time
        
        return cell
    }
    
}

