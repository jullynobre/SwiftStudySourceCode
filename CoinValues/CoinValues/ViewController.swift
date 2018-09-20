//
//  ViewController.swift
//  CoinValues
//
//  Created by Ada 2018 on 20/09/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

struct Coin{
    var name: String
    var buy: Double
    var sell: Double
    var symbol: String
}

class ViewController: UIViewController {

    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var symbolPicker: UIPickerView!
    @IBOutlet weak var sellLabel: UILabel!
    
    var coins : [Coin] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.symbolPicker.dataSource = self
        self.symbolPicker.delegate = self
        self.getRequestData()
        
    }
    
    func getRequestData(){
        let getURL = URL(string: "https://blockchain.info/ticker")!
        
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        getRequest.httpMethod = "GET"
        let getTask = URLSession.shared.dataTask(with: getRequest) { (data, response, error) in
            if error != nil { print ("GET Request in \(getRequest) Error: \(error!)") }
            if data != nil {
                do {
                    if let objJSON = try JSONSerialization.jsonObject(with: data!,
                                                                      options: []) as? [String: Any] {
                        DispatchQueue.main.async {
                            for country in objJSON{
                                let value = country.value as! [String: Any]
                                self.coins.append(Coin.init(name: country.key, buy: value["buy"] as! Double, sell: value["sell"] as! Double, symbol: value["symbol"] as! String))
                            }
                            self.symbolPicker.reloadAllComponents()
                        }
                    }
                } catch { print ("Erro ao formatar o retorno")}
            }
            else {
                print ("Received empty quest response from \(getRequest)")
            }
        }
        DispatchQueue.global(qos: .background).async {getTask.resume()}
    }
    
    func setDataValue(row: Int){
        self.buyLabel.text = String(format: "\(self.coins[row].symbol) %.2f", self.coins[row].buy)
        self.sellLabel.text = String(format: "\(self.coins[row].symbol) %.2f", self.coins[row].sell)
    }

}

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.coins.count > 0 {
            self.setDataValue(row: 0)
        }
        return self.coins.count
    }
    
    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.coins[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setDataValue(row: row)
    }
}

