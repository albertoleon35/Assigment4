//
//  StatesService.swift
//  assignment4
//
//  Created by Alberto Leon on 10/21/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

class StatesService : StatesServiceProtocol {
    
    let stateRepository: StatesRepository
    var states: Array<StateDTO>;
    
    init(stateRepository: StatesRepository) {
        self.stateRepository = stateRepository;
        self.states = Array<StateDTO>();
    }
    
    public func retrieveStates() -> Array<StateDTO>{
        self.states = self.stateRepository.retrieveStates().sorted { (x, y) -> Bool in
            x.stateName < y.stateName
        };
    
        return self.states;
    }
}
