//
//  StatesDTO.swift
//  assignment4
//
//  Created by Alberto Leon on 10/21/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

struct StateDTO  {
    let stateName : String;
    let capital : String;
    let abbreviation : String;
    let stateDate : String;
    
    init(stateName: String, capital: String, abbreviation: String, stateDate: String) {
        self.stateName = stateName;
        self.capital = capital;
        self.abbreviation = abbreviation;
        self.stateDate = stateDate;
    }
    
}
