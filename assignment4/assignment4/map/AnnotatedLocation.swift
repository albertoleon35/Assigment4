//
//  AnnotatedLocation.swift
//  assignment4
//
//  Created by Alberto Leon on 10/28/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation
import MapKit

class AnnotatedLocation:NSObject, MKAnnotation {
   
    var coordinate: CLLocationCoordinate2D
    let title:String?
    let subtitle:String?
    
    init(coordinate: CLLocationCoordinate2D, title:String, subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
