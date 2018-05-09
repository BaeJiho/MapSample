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
  
  @IBOutlet var searchBarVC: UISearchBar!
  @IBOutlet var mainMap: MTMapView!
  let locationManager = CLLocationManager()
  var baseBallModel: BaseBallDataModel!
  var point: MTMapPoint!
  var locationMarker: MTMapLocationMarkerItem!
  var locationData: [String: String]!
  
  
  @IBAction func removeKeyboard(_ sender: Any) {
    self.searchBarVC.resignFirstResponder()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let item = MTMapPOIItem()
    
    
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    searchBarVC.delegate = self
    mainMap.delegate = self
    mainMap.baseMapType = .standard
    mainMap.currentLocationTrackingMode = .onWithHeading
    mainMap.updateCurrentLocationMarker(self.locationMarker)
    mainMap.didReceiveMemoryWarning()
    mainMap.zoomIn(animated: true)
    item.markerType = .redPin
    item.showDisclosureButtonOnCalloutBalloon = true
    item.markerSelectedType = .yellowPin
    item.showAnimationType = .springFromGround
    item.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo.init(latitude: 35.168157089290226, longitude: 126.8890348647083))
    item.draggable = true
    mainMap.add(item)
    mainMap.fitAreaToShowAllPOIItems()
    getLocationData()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
  func getLocationData() {
    let testUrl = self.url
        let params: Parameters = locationData
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
  
}

extension ViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
  }
  
  
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

  
  
  func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
    print(error)
  }
}

