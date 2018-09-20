//
//  DeleteRequestViewController.swift
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

class DeleteRequestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doDeleteRequest(id: "5ba3a44bfaf162000470476e")
        self.doDeleteRequest(id: "5ba3a46afaf1620004704771")
        self.doDeleteRequest(id: "5ba3a4bdfaf1620004704773")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func doDeleteRequest(id: String){
        let getURL = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message/\(id)")!
        //        let getURL = URL(string: "http://intranet.maracanau.ifce.edu.br/ifce/ra/refeicao/filtrar")!
        
        var deleteRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        deleteRequest.httpMethod = "DELETE"
        
        let deleteTask = URLSession.shared.dataTask(with: deleteRequest){
            (data, resposne, error) in
            if error != nil{
                print("Get request in \(deleteRequest) Error: \(error!)")
            }
            if data == nil{
                print("Received empty quest reponse from \(deleteRequest)")
            }else{
                do{
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from GET \(deleteRequest) :\n \(resultObject)")
                    }
                } catch{
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response in \(deleteRequest)")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            deleteTask.resume()
        }
    }

}
