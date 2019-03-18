//
//  BarCellViewController.swift
//  AppartooTest
//
//  Created by Vigneswaranathan Sugeethkumar on 14/03/2019.
//  Copyright © 2019 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BarViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var regionMeters: Double = 1000
    let locationManager = CLLocationManager()

    var bar: PenseBete.Bar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerViewOnUserLocation()
        setupLocationManager()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let annotation = MKPointAnnotation()
        annotation.title = bar!.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: bar!.latitude, longitude: bar!.longitude)
        mapView.addAnnotation(annotation)
        
    }
    
    
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation(){
        let location = CLLocationCoordinate2DMake(bar!.latitude, bar!.longitude)
        let region  = MKCoordinateRegion.init(center: location, latitudinalMeters: regionMeters, longitudinalMeters: regionMeters)
        mapView.setRegion(region, animated: true)
    }
}
