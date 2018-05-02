//
//  ViewController.swift
//  DaumMapProject
//
//  Created by 배지호 on 2018. 5. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{

  @IBOutlet var mainMap: MTMapView!
  override func viewDidLoad() {
    super.viewDidLoad()
    mainMap.delegate = self
    mainMap.baseMapType = .standard
    mainMap.currentLocationTrackingMode = .onWithHeading
    
  }
}

extension ViewController: MTMapViewDelegate {
  
  func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
    print(error)
  }
}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let locations = manager.location?.coordinate {
      let lat = String(locations.latitude)
      let lon = String(locations.longitude)
      print("lat:\(lat), lon: \(lon) ")
    }
  }
}
