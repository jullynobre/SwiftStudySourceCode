//
//  CollectionViewController.swift
//  ChallengeColectionView
//
//  Created by Ada 2018 on 07/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Item"

class CollectionViewController: UICollectionViewController {

    var items = [CollectionItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        for i in 1...10 {
           
            let f = CGFloat(Float(i)/10.0)
            
            items.append(CollectionItem(backgroundColor: UIColor(displayP3Red: f, green: f, blue: f, alpha: 1), number: i))
            
        }
        
        
        // Register cell classes
        //self.collectionView!.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.contentSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(10))
        
        if let layout = self.collectionView!.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 50.0
            layout.minimumInteritemSpacing = 150.0
            print("Horizontal")
        }
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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
    
        // Configure the cell
    
        let item = self.items[indexPath.row]
        
        cell.contentView.backgroundColor = item.backgroundColor
        cell.label.text = "\(item.number)"
        
        cell.frame.size = CGSize(width: CGFloat(100), height: CGFloat(100))
        
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
