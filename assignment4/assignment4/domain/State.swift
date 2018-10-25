//
//  States.swift
//  assignment4
//
//  Created by Alberto Leon on 10/23/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

struct State  {
    let stateName : String;
    let capital : String;
    let abbreviation : String;
    let stateDate : Date;
    
    init(stateName: String, capital: String, abbreviation: String, stateDate: Date) {
        self.stateName = stateName;
        self.capital = capital;
        self.abbreviation = abbreviation;
        self.stateDate = stateDate;
    }
    
}
