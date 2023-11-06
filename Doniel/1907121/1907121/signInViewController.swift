//
//  signInViewController.swift
//  1907121
//
//  Created by Biduit on 14/10/23.
//

import UIKit
import FirebaseDatabase

class signInViewController: UIViewController {
    
    private let database = Database.database().reference()
    
    @IBOutlet weak var Email: UITextField!
    
    
    @IBOutlet weak var btn: UIButton!
    
    
    @IBOutlet weak var Pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sign(_ sender: Any) {
        
        let email = Email.text ?? ""  // Ensure a default value if the text is nil
        let pass = Pass.text ?? ""

                // Push data to the Firebase Realtime Database
                let data = ["Email": email, "Pass": pass]
                database.child("users").childByAutoId().setValue(data) { (error, reference) in
                    if let error = error {
                        print("Error adding data to Firebase: \(error.localizedDescription)")
                    } else {
                        print("Data added to Firebase successfully!")
                    }
                }
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
