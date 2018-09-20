//
//  ViewController.swift
//  web
//
//  Created by Ada 2018 on 20/09/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNumChar: UILabel!
    @IBOutlet weak var textViewHTML: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        doDownloadWebPage()
    }
    func doDownloadWebPage(){
        let httpURL = URL(string: "http://intranet.maracanau.ifce.edu.br/ifce/ra")!
        let httpTask = URLSession.shared.dataTask(with: httpURL){
            (data, resposne, erro) in
            guard let validData = data,erro == nil else{
                print("Erro obtendo website \(httpURL)")
                return
            }
            let results = String(data: validData, encoding: String.Encoding.utf8) ??
                "Erro decodificando website \(httpURL)"
            
            DispatchQueue.main.async {
                self.lbNumChar.text = String(results.count)
                self.textViewHTML.text = results
            }
        }
        DispatchQueue.global(qos: .background).async {
            httpTask.resume()
        }
    }


}

