//
//  ViewController.swift
//  Mapfirstproject
//
//  Created by Jomms on 05/01/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyBEw9RQC7xibWbU-7ZPCg6PUWohFO9Eg_s")
       
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.delegate = self
     }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
            
        }
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude:coordinate.latitude, longitude:coordinate.latitude,zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:coordinate.latitude, longitude:coordinate.latitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
        
    }
    
    
}

