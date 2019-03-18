//
//  MapViewController.swift
//  AppartooTest
//
//  Created by Vigneswaranathan Sugeethkumar on 14/03/2019.
//  Copyright © 2019 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionMeters: Double = 1000
    let bars = ParseJson.getDataFromJson(data: ParseJson.jsonData!)?.bars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        addAllBarAnnotation()
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func addAllBarAnnotation(){
        for bar in bars! {
            let annotation = MKPointAnnotation()
            annotation.title = bar!.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: bar!.latitude, longitude: bar!.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let region  = MKCoordinateRegion.init(center: location, latitudinalMeters: regionMeters, longitudinalMeters: regionMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else {
            //Show allert letter user know ther have to turn is on
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            
        case .denied:
            //Show alert instructing
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
        }
    }
}

