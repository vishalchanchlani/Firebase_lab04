//
//  mainpageViewController.swift
//  MAPD714-F2019-Lesson11
//
//  Created by VISHAL on 2019-11-22.
//  Copyright © 2019 VC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore


class mainpageViewController: UIViewController {

    
    var db:Firestore?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var contactno: UITextField!
    @IBOutlet weak var address: UITextField!
    
    
    @IBAction func addbutton(_ sender: UIButton) {
        
        let uid = self.defaults.string(forKey: "uid")!
        
        let nameText = name.text!
        let ageText = age.text!
        let contactText = contactno.text!
        
        let parameter = ["name":nameText,"age":ageText,"contact":contactText,"address":address.text] as [String : Any]
        
        
        db = Firestore.firestore()
        db?.collection("Data").document(uid).setData(parameter)
        print("Data Added Succesfully")
    }
    
    
    
    @IBAction func updatebutton(_ sender: UIButton) {
        let uid = self.defaults.string(forKey: "uid")!
        
        let nameText = name.text!
        let ageText = age.text!
        let contactText = contactno.text!
        
        let parameter = ["name":nameText,"age":ageText,"contact":contactText,"address":address.text] as [String : Any]
        
        
        db = Firestore.firestore()
        db?.collection("Data").document(uid).updateData(parameter)
        print("Data Updated Succesfully")
    }
    
    
    @IBAction func deletebutton(_ sender: UIButton) {
//
        let uid = self.defaults.string(forKey: "uid")!
//
//        let nameText = name.text!
//        let ageText = age.text!
//        let contactText = contactno.text!
//
//
//        let parameter = ["name":nameText,"age":ageText,"contact":contactText,"address":address.text] as [String : Any]
        
        
        db = Firestore.firestore()
        db?.collection("Data").document(uid).delete()
        print("Data Deleted Succesfully")
    }
    
}
