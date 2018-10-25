//
//  StatesRepository.swift
//  assignment4
//
//  Created by Alberto Leon on 10/21/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

class StatesRepository : StatesRepositoryProtocol {
    
    fileprivate let Abbreviation = "Abbreviation";
    fileprivate let State = "State";
    fileprivate let Capital = "Capital";
    fileprivate let StateDay = "StateDay";
    fileprivate let StateYear = "StateYear";
    fileprivate let StateMonth = "StateMonth";
    
    public func retrieveStates() -> Array<StateDTO> {
        var states = Array<StateDTO>();
        
        if let path = Bundle.main.path(forResource: "States", ofType: "plist"),
            let arrayOfStates = NSArray(contentsOfFile: path){
            
            
            for item in arrayOfStates {
                
                guard let valueDictionary = item as? Dictionary<String,String> else {
                    continue;
                }
                
                guard let state = valueDictionary[self.State],
                    let capital = valueDictionary[self.Capital],
                    let abbreviation = valueDictionary[self.Abbreviation],
                    let stateDay = valueDictionary[self.StateDay],
                    let stateYear = valueDictionary[self.StateYear],
                    let stateMonth = valueDictionary[self.StateMonth] else {
                    continue;
                }
                    
                let stateDTO = StateDTO(stateName: state, capital: capital, abbreviation: abbreviation, stateDay: stateDay, stateYear: stateYear, stateMonth: stateMonth);
                states.append(stateDTO);
            }
            
        }
        return states;
    }
}
