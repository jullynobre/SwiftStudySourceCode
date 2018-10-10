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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMapArea_1()
    }
    
    func showMapArea_1(){
        let latitude: CLLocationDegrees = -3.743993
        let longitude: CLLocationDegrees = -38.535674
        
        let centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }

}

