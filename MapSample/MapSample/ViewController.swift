//
//  ViewController.swift
//  MapSample
//
//  Created by Jully Nobre on 10/10/18.
//  Copyright © 2018 Jully Nobre. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
    }
    
    func startUpdatingLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func showMapArea() {
        let latitude: CLLocationDegrees = -3.743993
        let longitude: CLLocationDegrees = -38.535674
        
        self.setLocationInMap(center:  CLLocationCoordinate2DMake(latitude, longitude))
    }
    
    func setLocationInMap( center: CLLocationCoordinate2D ) {
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: center, span: span)
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func markPointInMap( coordinate: CLLocationCoordinate2D, title: String, subtitle: String ) {
        let pointAnotation = MKPointAnnotation()
        pointAnotation.coordinate = coordinate
        pointAnotation.title = title
        pointAnotation.subtitle = subtitle
        
        self.mapView.addAnnotation(pointAnotation)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations.last!
        
        self.setLocationInMap(center: currentLocation.coordinate)
    }
}
