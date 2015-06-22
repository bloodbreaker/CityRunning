//
//  ViewController.swift
//  CityRunning
//
//  Created by Yan Zhang on 6/22/15.
//  Copyright (c) 2015 Yan Zhang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class ViewController: UIViewController, CLLocationManagerDelegate {

  
  let locationManager = CLLocationManager()
//  @IBOutlet weak var mapView: MKMapView!
  let regionRadius: CLLocationDistance = 1000

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // set the initial value
//    let initialLocation = CLLocation(latitude: 49.403634, longitude:8.676662)
//    
//    centerMapOnLocation(initialLocation)
    
    // setup the location delegate
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestAlwaysAuthorization()
    self.locationManager.startUpdatingLocation()
  }
  
  


//  func centerMapOnLocation(location: CLLocation) {
//    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//      regionRadius * 3.0, regionRadius * 3.0)
//    
//    mapView.setRegion(coordinateRegion, animated: true)
//  }
  


  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
    CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
      
      if error != nil {
        println("Error: " + error.localizedDescription)
        return
      }
      
      if placemarks.count > 0 {
        let pm = placemarks[0] as! CLPlacemark
        self.displayLocationInfo(pm)
      } else {
        println("Error: " + error.localizedDescription)
      }
    })
    
  }
  
  
  
  
  func displayLocationInfo(placemark: CLPlacemark) {
    
    locationManager.stopUpdatingLocation()
    
    println(placemark.locality)
    println(placemark.postalCode)
    println(placemark.administrativeArea)
    println(placemark.country)
  }
  
  
  
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    
    println("Error: " + error.localizedDescription)
    
    
  }


}

