//
//  HomeViewController.swift
//  1907121
//
//  Created by Biduit on 14/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    var isTextVisible = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
