//
//  PostRequestViewController.swift
//  web
//
//  Created by Ada 2018 on 20/09/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//
/*
 5ba3a33cfaf1620004704761
 5ba3a372faf1620004704765
 5ba3a44bfaf162000470476e
 5ba3a46afaf1620004704771
 5ba3a4bdfaf1620004704773
 */

import UIKit

class PostRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.doPostRequest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPostRequest(){
        let postURL = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message")!
        var postRequest = URLRequest(url: postURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        postRequest.httpMethod = "POST"
        
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        postRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let parameters: [String: Any] = ["text": "⭐️"]
        
        do{
            let JSONParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
            postRequest.httpBody = JSONParams
        } catch { print("Error") }
        
        let postTask = URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
            if error != nil {
                print("Post Request Error")
            }
            
            if data == nil{
                DispatchQueue.main.async {
                    print("Recived Empty Response")
                }
            } else {
                do{
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results getter: \(resultObject)")
                    }
                } catch{ DispatchQueue.main.async { print("Unable to parse JSON Decoder") } }
            }
        }
        DispatchQueue.global(qos: .background).async{ postTask.resume() }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
