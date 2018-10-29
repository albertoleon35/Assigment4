//
//  MapTabViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/24/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit
import MapKit

class MapTabViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = MKMapType.standard
        
        addMapAnnotations()
        mapView.showAnnotations(self.mapView.annotations, animated: true)
        mapView!.region = sanDiegoCountyLocation()
    }
    
    fileprivate func sanDiegoCountyLocation()-> MKCoordinateRegion {
        let center = CLLocationCoordinate2DMake(32.76572795, -117.07319880 )
        let widthMeters:CLLocationDistance = 100
        let heightMeters:CLLocationDistance = 1000*120
        return MKCoordinateRegion(center: center, latitudinalMeters: widthMeters, longitudinalMeters: heightMeters)
    }
    
    fileprivate func addMapAnnotations() {
        let elCajonAnnotation = AnnotatedLocation(coordinate: CLLocationCoordinate2D(latitude: 32.794773, longitude: -116.962527), title:"El Cajon", subtitle: "City")
        let escondidoAnnotation = AnnotatedLocation(coordinate: CLLocationCoordinate2D(latitude: 33.1192068, longitude: -117.086421), title:"Escondido", subtitle: "City")
        mapView.addAnnotation(elCajonAnnotation)
        mapView.addAnnotation(escondidoAnnotation)
    }
    
}
