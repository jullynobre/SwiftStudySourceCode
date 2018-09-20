//
//  GetRequestViewController.swift
//  web
//
//  Created by Ada 2018 on 20/09/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class GetRequestViewController: UIViewController {
    
    @IBOutlet weak var textViewGET: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doGetRequest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doGetRequest(){
        let getURL = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message")!
//        let getURL = URL(string: "http://intranet.maracanau.ifce.edu.br/ifce/ra/refeicao/filtrar")!

        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        getRequest.httpMethod = "GET"
        
        let getTask = URLSession.shared.dataTask(with: getRequest){
            (data, resposne, error) in
            if error != nil{
                print("Get request in \(getRequest) Error: \(error!)")
            }
            if data != nil{
                do{
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from GET \(getRequest) :\n \(resultObject)")
                        self.textViewGET.text = "\(resultObject)"
                    }
                } catch{
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response in \(getRequest)")
                    }
                }
            }else{
                print("Received empty quest reponse from \(getRequest)")
            }
        }
        DispatchQueue.global(qos: .background).async {
            getTask.resume()
        }
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
