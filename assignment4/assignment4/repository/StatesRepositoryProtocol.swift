//
//  StatesRepositoryProtocol.swift
//  assignment4
//
//  Created by Alberto Leon on 10/23/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

protocol StatesRepositoryProtocol {
    func retrieveStates() -> Array<StateDTO>
}
