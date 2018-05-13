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

class ViewController: UIViewController {
  
  let url: String = "https://dapi.kakao.com/v2/local/geo/coord2address.json"
  
  @IBOutlet var mainMap: MTMapView!
  let locationManager = CLLocationManager()
  var baseBallModel: BaseBallDataModel!
  var item: MTMapPOIItem!
  var locationData: [String: String]!
  
  
  
  @IBAction func removeKeyboard(_ sender: Any) {
    //    self.searchBarVC.resignFirstResponder()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainMap.delegate = self
    mainMap.baseMapType = .standard
//    mainMap.currentLocationTrackingMode = .onWithHeading
    mainMap.didReceiveMemoryWarning()
    mainMap.zoomIn(animated: true)
    mapPinItem()
    getLocationData()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  func getLocationData() {
    let testUrl = self.url
    let params: Parameters = ["x":"127.42916311992511", "y":"36.31708173772321"]
    let header = ["Authorization":"KakaoAK 12abcf4e8437b5681dc74af19e05e8fb"]
    Alamofire
      .request(testUrl, method: .get, parameters: params, headers: header)
      .validate()
      .responseJSON { (response) in
        switch response.result {
        case .success:
          if let data = response.data {
            do {
              let baseBallData = try JSONDecoder().decode(BaseBallDataModel.self, from: data)
              print(baseBallData)
              print("=========================")
            } catch(let error) {
              print(error)
              print("decode Error: \(error.localizedDescription)")
            }
          }
        case .failure(let error):
          print(error)
          print("Error: \(error.localizedDescription)")
        }
    }
  }
}

extension ViewController {
  func mapPinItem() {
    let item = MTMapPOIItem()
    item.markerType = .redPin
    item.showDisclosureButtonOnCalloutBalloon = true
    item.markerSelectedType = .yellowPin
    item.showAnimationType = .springFromGround
    item.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo.init(latitude: 36.31708173772321, longitude: 127.42916311992511))
    item.draggable = true
    mainMap.add(item)
    mainMap.fitAreaToShowAllPOIItems()
  }
}

extension ViewController: UISearchBarDelegate {
  
//  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//  }
  
  
  //  func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
  //    if searchBarVC.text == "" {
  //      searchBarVC.becomeFirstResponder()
  //    } else {
  //      searchBarVC.resignFirstResponder()
  //    }
  //    return true
  //  }
}

extension ViewController: MTMapViewDelegate {
  
  func mapView(_ mapView: MTMapView!, selectedPOIItem poiItem: MTMapPOIItem!) -> Bool {
    return true
  }
  
//  func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
//    <#code#>
//  }
  
  
  func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
    print(error)
  }
}

