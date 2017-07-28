//
//  AddToolViewController.swift
//  Tool Collector
//
//  Created by Trent Stevens on 27/07/17.
//  Copyright © 2017 Trent Stevens. All rights reserved.
//

import UIKit

class AddToolViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

//Outlets
    
    //image of item
    @IBOutlet weak var itemImage: UIImageView!
   
    //description of item text field entry
    @IBOutlet weak var itemTextField: UITextField!
    
//Class properties
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
//Buttons
    
    //camera button tapped
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    //photos button tapped
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let picture = info[UIImagePickerControllerOriginalImage] as! UIImage
        itemImage.image = picture
       imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    //Add button tapped
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let tool = Tool(context: context)
        
        tool.itemDescription = itemTextField.text
        tool.itemPhoto = UIImagePNGRepresentation(itemImage.image!)!as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }
}
