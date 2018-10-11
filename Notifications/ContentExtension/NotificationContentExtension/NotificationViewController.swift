//
//  NotificationViewController.swift
//  NotificationContentExtension
//
//  Created by Jully Nobre on 09/10/18.
//  Copyright © 2018 Jully Nobre. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import MapKit

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMapArea()
        
        self.mapView.showsUserLocation = true
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
    
    func didReceive(_ notification: UNNotification) {
    }

}
