//
//  ViewController.swift
//  MAPD714-F2019-Lesson11
//
//  Created by VISHAL on 2019-11-20.
//  Copyright © 2019 VC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    let defaults = UserDefaults.standard
    
    
    
    
    @IBAction func Loginbutton(_ sender: UIButton)
    {   guard
        let email = self.email.text ,
        let password = self.password.text
        else{
            print("EMAIL/Password cannot be empty")
        return
    }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // [START_EXCLUDE]
          
            guard let user = authResult?.user, error == nil else {
             
              return
            }
            print("\(user.email!) created",user.uid)
            self.defaults.set(user.uid, forKey: "uid")
            
            self.performSegue(withIdentifier: "mainpage", sender: nil)
           
        }
    }
    
    @IBAction func signupbutton(_ sender: UIButton) {
        guard
            let email = self.email.text ,
            let password = self.password.text
            else{
                print("EMAIL/Password cannot be empty")
            return
        }
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              // [START_EXCLUDE]
              
                guard let user = authResult?.user, error == nil else {
                 
                  return
                }
                print("\(user.email!) created",user.uid)
                
                
                self.performSegue(withIdentifier: "mainpage", sender: nil)
               
            }
    }
    
    
    
}
