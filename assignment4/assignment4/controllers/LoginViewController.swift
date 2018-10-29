//
//  ViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/17/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let segueToLoginViewControllerIdentifier = "toLoginViewFromNameTabController"
    let segueToTabViewController = "toTabViewController"
    let numberOfCharactersDisplay: Int = 3;
    var userName = "";
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var tabButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func userStartedTypingHisName(_ sender: Any) {
            guard let nameTextBoxValue = nameTextBox.text else {
            enableStateAndTabsButton(enabled: false);
            return;
        }
        guard isTextBoxTextGreaterThanThree(value: nameTextBoxValue) else {
            enableStateAndTabsButton(enabled: false);
            return;
        }
        
        guard shouldIEnableStateAndTabsButtons() else {
            enableStateAndTabsButton(enabled: false);
            return
        }
        enableStateAndTabsButton(enabled: true);
    }
    
    @IBAction func userStartedTypingPassword(_ sender: Any) {
        guard let passwordTextBoxValue = passwordTextBox.text else {
            enableStateAndTabsButton(enabled: false);
            return;
        }
        guard isTextBoxTextGreaterThanThree(value: passwordTextBoxValue) else {
            enableStateAndTabsButton(enabled: false);
            return;
        }
        
        guard shouldIEnableStateAndTabsButtons() else {
            enableStateAndTabsButton(enabled: false);
            return
        }
        enableStateAndTabsButton(enabled: true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  segueToTabViewController {
            let tabBarController = segue.destination as! UITabBarController
            
            for viewController in tabBarController.viewControllers! {
                if let nameTabViewController = viewController as? NameTabViewController {
                    nameTabViewController.userName = self.userName;
                }
            }
        }
    }
    
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
        if segue.identifier == segueToLoginViewControllerIdentifier {
            
            guard let nameTextBoxValue = nameTextBox.text else {
                return;
            }
            
            guard !userName.trimmingCharacters(in: .whitespaces).isEmpty else {
                return;
            }
            
            guard self.userName.count >= 3 else {
                nameTextBox.text = userName
                enableStateAndTabsButton(enabled: false)
                return;
            }
            
            guard nameTextBoxValue.lowercased() != userName.lowercased()  else {
                return;
            }
            nameTextBox.text = userName
        }
    }

    fileprivate func isTextBoxTextGreaterThanThree(value: String) -> Bool {
        let trimmedString = value.trimmingCharacters(in: .whitespaces)
        guard !trimmedString.isEmpty && trimmedString.count >= numberOfCharactersDisplay else {
            return false;
        }
        
        return true;
    }
    
    fileprivate func shouldIEnableStateAndTabsButtons() -> Bool {
        
        guard let nameTextBoxValue = nameTextBox.text, let passwordTextBoxValue = passwordTextBox.text, !nameTextBoxValue.isEmpty && !passwordTextBoxValue.isEmpty else {
            return false;
        }
        
        let name = nameTextBoxValue.trimmingCharacters(in: .whitespaces);
        let password = passwordTextBoxValue.trimmingCharacters(in: .whitespaces);
        
        guard name.count >= numberOfCharactersDisplay  && password.count >= numberOfCharactersDisplay else {
            return false;
        }
        self.userName = nameTextBoxValue;
        return true;
    }
    
    fileprivate func enableStateAndTabsButton(enabled value: Bool) {
        stateButton.isEnabled = value;
        tabButton.isEnabled = value;
    }
}
