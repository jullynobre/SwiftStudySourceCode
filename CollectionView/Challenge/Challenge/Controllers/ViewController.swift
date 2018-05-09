//
//  ViewController.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    @IBOutlet weak var bbiSelect: UIBarButtonItem!
    @IBOutlet weak var bbiTrash: UIBarButtonItem!
    lazy var picker = UIImagePickerController()
    
    var photos: [String: [Photo]] = ["12/5/18": [Photo(image: #imageLiteral(resourceName: "dog")), Photo(image: #imageLiteral(resourceName: "dubai")), Photo(image: #imageLiteral(resourceName: "sol")), Photo(image: #imageLiteral(resourceName: "landscape")), Photo(image: #imageLiteral(resourceName: "unicorn"))]]
    
    var isInSelectionMode: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.photosCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "photo")
        
        self.photosCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        self.photosCollectionView.allowsMultipleSelection = true
        
        self.photosCollectionView.delegate = self
        self.photosCollectionView.dataSource = self
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.bbiTrash.isEnabled = isInSelectionMode
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bbiSelectAction(_ sender: UIBarButtonItem) {
        self.isInSelectionMode = !self.isInSelectionMode
        self.bbiSelect.title = (isInSelectionMode ? "Cancel" : "Select")
        //self.bbiTrash.isEnabled = isInSelectionMode
        
        if isInSelectionMode {}
        
    }
    
    @IBAction func didTapAddImageButton(_ sender: Any) {
        self.picker.delegate = self
        self.picker.allowsEditing = true
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.picker.sourceType = .camera
            //self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.present(self.picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { (action) in
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
