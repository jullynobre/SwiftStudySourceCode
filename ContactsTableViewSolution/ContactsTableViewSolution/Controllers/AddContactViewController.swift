//
//  AddContactViewController.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var contactPhoto: UIImageView!
    let pickerController = UIImagePickerController()
    
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
        self.contactPhoto.layer.masksToBounds = true
        self.contactPhoto.layer.cornerRadius = 75
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickChooseImageButton(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func DidTapCancelButton(_ sender: Any) {
        let alertDelete = UIAlertController(title: "Cancel Operation", message: "Do you really want to cancel this new contact?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .destructive, handler:
        { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alertDelete.addAction(deleteAction)
        alertDelete.addAction(cancelAction)
        self.present(alertDelete, animated: true, completion: nil)
    }
}

extension AddContactViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let choosedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.contactPhoto.contentMode = .scaleAspectFill
        self.contactPhoto.image = choosedImage
        
        dismiss(animated: true, completion:  nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
