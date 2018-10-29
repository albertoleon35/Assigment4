//
//  NameTabViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/24/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class NameTabViewController: UIViewController {
    
    let segueToLoginViewControllerIdentifier = "toLoginViewFromNameTabController"
    @IBOutlet weak var userNameTextBox: UITextField!
    var userName: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUserName(name: userName)
    }
    
    @IBAction func userStartedTypingUserName(_ sender: Any) {
        guard let userNameValue = userNameTextBox.text else {
            return;
        }
        
        guard !userNameValue.isEmpty else {
            return;
        }
        
        self.userName = userNameValue
        
        
    }
    @IBAction func userFinishedEditing(_ sender: Any) {
        guard let userNameValue = userNameTextBox.text else {
            return;
        }
        
        guard !userNameValue.isEmpty  else {
            return;
        }
        self.userName = userNameValue;
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToLoginViewControllerIdentifier {
            guard let loginViewController = segue.destination as? LoginViewController else {
                return;
            }
            
            guard !self.userName.isEmpty  else {
                return;
            }
            
            loginViewController.userName = self.userName;
        }
    }
    
    fileprivate func setUserName(name: String) {
        guard !self.userName.isEmpty  else {
            return;
        }
        
        userNameTextBox.text = userName;
    }
}
