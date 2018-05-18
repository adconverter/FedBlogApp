//
//  AuthorizationViewController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 17.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    
    @IBOutlet weak var checkingUserIndicator: UIActivityIndicatorView!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearUI()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        guard let name = nameTextField.text,
            let password = passwordTextField.text else {return}
        checkingUserIndicator.startAnimating()
        login(name: name, password: password, completionHandler: {statusCode in
            self.checkingUserIndicator.stopAnimating()
            switch statusCode {
            case 200: self.performSegue(withIdentifier: "segueToBlog", sender: self)
            case 404: self.incorrectLabel.isHidden = false
            default: return
            }
        })
    }
    
    
    func clearUI() {
        nameTextField.text = ""
        passwordTextField.text = ""
        incorrectLabel.isHidden = true
        checkingUserIndicator.stopAnimating()
    }
    
    @IBAction func unwindToAuthorizationView(unwindSegue: UIStoryboardSegue){
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
