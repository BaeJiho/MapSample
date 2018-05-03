//
//  ViewController.swift
//  DaumMapProject
//
//  Created by 배지호 on 2018. 5. 2..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController{
  
  @IBOutlet var searchBarVC: UISearchBar!
  @IBOutlet var mainMap: MTMapView!
  let locationManager = CLLocationManager()
  var item: MTMapPOIItem!
  var point: MTMapPoint!
  
  @IBAction func removeKeyboard(_ sender: Any) {
    self.searchBarVC.resignFirstResponder()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    locationManager.delegate = self
    searchBarVC.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingHeading()
    mainMap.delegate = self
    mainMap.baseMapType = .standard
    mainMap.currentLocationTrackingMode = .onWithHeading
    mainMap.didReceiveMemoryWarning()
    mainMap.zoomIn(animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
}

extension ViewController: UISearchBarDelegate {
//  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//    <#code#>
//  }
  
  
  func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
    if searchBarVC.text == "" {
      searchBarVC.becomeFirstResponder()
    } else {
      searchBarVC.resignFirstResponder()
    }
    return true
  }
}

extension ViewController: MTMapViewDelegate {
  
  func mapView(_ mapView: MTMapView!, selectedPOIItem poiItem: MTMapPOIItem!) -> Bool {
    return true
  }
  
  //  func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
  //    if let locations = location.mapPointGeo().latitude {
  //      print(Double(locations))
  //    }
  //  }
  
  func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
    print(error)
  }
}

extension ViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let locations = manager.location?.coordinate {
      print("\(locations.latitude), \(locations.longitude)")
      let lat = String(locations.latitude)
      let lon = String(locations.longitude)
    }
  }
}
