//
//  PutRequestViewController.swift
//  web
//
//  Created by Ada 2018 on 20/09/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class PutRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.doPutRequest(id: "5b96c71822a08800044d215f")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func doPutRequest(id: String){
        let getURL = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message/\(id)")!
        
        var putRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        putRequest.httpMethod = "PUT"
        putRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") //sending JSON data
        putRequest.setValue("application/json", forHTTPHeaderField: "Accept") //receive JSON data
        
        let parameters: [String: Any] = ["text": "I DID IT!"]
        
        do{
            let JSONParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
            putRequest.httpBody = JSONParams
        } catch { print("Error") }

        
        let putTask = URLSession.shared.dataTask(with: putRequest){
            (data, resposne, error) in
            if error != nil{
                print("Get request in \(putRequest) Error: \(error!)")
            }
            if data == nil{
                print("Received empty quest reponse from \(putRequest)")
            }else{
                do{
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from GET \(putRequest) :\n \(resultObject)")
                    }
                } catch{
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response in \(putRequest)")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            putTask.resume()
        }
    }

}
