//
//  StateViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/22/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {

    var stateName: String = ""
    var stateAbbreviation: String = ""
    var capital: String = ""
    var becameState: String = ""
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateAbbreviationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var becameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !becameState.isEmpty else {
            return;
        }
        
        becameStateLabel.text = becameState;
        stateLabel.text = stateName;
        stateAbbreviationLabel.text = stateAbbreviation;
        capitalLabel.text = capital;
        
        becameStateLabel.isHidden = false;
        stateLabel.isHidden = false;
        stateAbbreviationLabel.isHidden = false;
        capitalLabel.isHidden = false;

    }
}
