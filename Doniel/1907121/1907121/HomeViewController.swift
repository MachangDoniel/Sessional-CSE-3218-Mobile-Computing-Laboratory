//
//  HomeViewController.swift
//  1907121
//
//  Created by Biduit on 14/10/23.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var Email: UILabel!
    
    var email = ""
    var pass = ""
    
    var isTextVisible = true

    override func viewDidLoad() {
        super.viewDidLoad()
        let databaseReference = Database.database().reference().child("users")

        // Query the database to retrieve the most recently added data
        databaseReference.queryLimited(toLast: 1).observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                if let userData = snapshot.children.allObjects.first as? DataSnapshot,
                   let userValues = userData.value as? [String: Any] {
                    if let uemail = userValues["Email"] as? String,
                       let upass = userValues["Pass"] as? String {
                        self.updateUI(email: uemail, pass: upass)
                    }
                }
            } else {
                print("No data found in the Firebase database.")
            }
        }
    }

    func updateUI(email: String, pass: String) {
        DispatchQueue.main.async {
            self.Email.text = "Email: \(email)"
        }
    }

    @IBAction func Change(_ sender: UIButton) {
        
        if isTextVisible {
                    myButton.setTitle("Changed!", for: .normal)
                    myImageView.image = UIImage(named: "facebook")
                } else {
                    myButton.setTitle("Change", for: .normal)
                    myImageView.image = UIImage(named: "google")
                }
                
                isTextVisible = !isTextVisible    }
}
