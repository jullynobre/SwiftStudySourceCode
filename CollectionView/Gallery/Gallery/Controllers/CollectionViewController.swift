//
//  CollectionViewController.swift
//  Gallery
//
//  Created by Ada 2018 on 07/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class CollectionViewController: UICollectionViewController {
    
    private var entertainmentItems = [EntertainmentType: [EntertainmentItem]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        entertainmentItems[.serie] = [EntertainmentItem(type: .serie, name: "Vikings"),
                                      EntertainmentItem(type: .serie, name: "Stranger Things"),
                                      EntertainmentItem(type: .serie, name: "La Casa de Papel")]
        
        entertainmentItems[.filme] = [EntertainmentItem(type: .filme, name: "John Wick"),
                                      EntertainmentItem(type: .filme, name: "The Avengers: Infinity War"),
                                      EntertainmentItem(type: .filme, name: "Nada a perder")]
        
        entertainmentItems[.book] = [EntertainmentItem(type: .book, name: "Mitos e lendas Celtas da Irlanda"),
                                      EntertainmentItem(type: .book, name: "Harry Potter"),
                                      EntertainmentItem(type: .book, name: "Guardiões da Galaxia")]
        

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "EntertainmentItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 10.0
            layout.minimumLineSpacing = 10.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.entertainmentItems.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        let key: EntertainmentType = self.entertainmentItems.keys.filter { $0.rawValue == section }[0]
        
        guard let items = self.entertainmentItems[key] else { return 0}
        
        return items.count
       
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EntertainmentItemCollectionViewCell
    
        let key = self.entertainmentItems.keys.filter { $0.rawValue == indexPath.section }[0]
        
        guard let item = self.entertainmentItems[key]?[indexPath.row] else {
            return cell
        }
        
        cell.lblName.text = item.name
        
        return cell
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: CGFloat(40))
    }
}
