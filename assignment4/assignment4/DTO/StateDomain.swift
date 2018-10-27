//
//  StatesDTO.swift
//  assignment4
//
//  Created by Alberto Leon on 10/21/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

struct StateDomain  {
    let stateName : String;
    let capital : String;
    let abbreviation : String;
    let stateDay : String;
    let stateYear : String;
    let stateMonth : String;
    
    init() {
        self.stateName = ""
        self.capital = ""
        self.abbreviation = ""
        self.stateDay = ""
        self.stateYear = ""
        self.stateMonth = ""
    }
    
    init(stateName: String, capital: String, abbreviation: String, stateDay: String, stateYear: String, stateMonth: String) {
        self.stateName = stateName;
        self.capital = capital;
        self.abbreviation = abbreviation;
        self.stateDay = stateDay;
        self.stateYear = stateYear;
        self.stateMonth = stateMonth;
    }
    
    public func formattedDate() -> String {
        return "\(self.stateMonth) \(self.stateDay), \(self.stateYear)";
    }
    
}
