//
//  StatesTableViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/22/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class StatesTableViewController: UITableViewController {
    
    let cellIdentifier = "StateCell"
    let segueToStateControllerIdentifier = "toStateViewController"
    var states: Array<StateDTO> = Array<StateDTO>();
    var state: StateDTO = StateDTO();

    override func viewDidLoad() {
        super.viewDidLoad()
        states = StatesService(stateRepository: StatesRepository()).retrieveStates();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueToStateControllerIdentifier {
            guard let stateViewController = segue.destination as? StateViewController else {
                return;
            }
            stateViewController.becameState = state.formattedDate()
            stateViewController.capital = state.capital;
            stateViewController.stateName = state.stateName;
            stateViewController.stateAbbreviation = state.abbreviation;
        }
    }
    
    @IBAction func unwindToStatesViewController(segue: UIStoryboardSegue) {
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel!.text = states[indexPath.row].stateName;

        return cell;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row;
        self.state = states[index];
        self.performSegue(withIdentifier: segueToStateControllerIdentifier, sender: self)
        
    }
}
