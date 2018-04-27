//
//  AddContactViewController.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit
import CoreData

class AddContactViewController: UIViewController {

    @IBOutlet weak var contactPhoto: UIImageView!
    let pickerController = UIImagePickerController()
    
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    var del : contactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
        self.contactPhoto.layer.masksToBounds = true
        self.contactPhoto.layer.cornerRadius = 75
        self.contactPhoto.image = #imageLiteral(resourceName: "contact-avatar")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddContactViewController.imageTapped))
        self.contactPhoto.addGestureRecognizer(tapGesture)
        self.contactPhoto.isUserInteractionEnabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func imageTapped(){
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(pickerController, animated: true, completion: nil)
    
    }
    @IBAction func didClickDoneButton(_ sender: Any) {
        guard let name = contactName.text else {
            fillTextFields()
            return
        }
        guard let phone = contactPhone.text else {
            fillTextFields()
            return
        }
        //guard let photo = contactPhoto.image else {
        //    fillTextFields()
        //    return
        //}
        
        //let newContact = Contact(WithName: name, phone: phone, photo: photo)
        //del?.addContact(newContact)
        //self.dismiss(animated: true, completion: nil)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "ContactEntity", in: context)!
        let contact = NSManagedObject(entity: userEntity, insertInto: context)
        
        contact.setValue(name, forKey: "name")
        contact.setValue(phone, forKey: "phone")
        
        //contact.name = name
        //contact.phone = phone
        //contact.photo = photo
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.dismiss(animated: true, completion: nil)
    }
 
    
    
    func fillTextFields() {
        let alertFill = UIAlertController(title: "Error", message: "Fill all the textfields to save the new contact.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertFill.addAction(cancelAction)
        self.present(alertFill, animated: true, completion: nil)
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
