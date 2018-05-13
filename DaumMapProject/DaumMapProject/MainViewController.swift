//
//  MainViewController.swift
//  DaumMapProject
//
//  Created by 배지호 on 2018. 5. 8..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet var mainCollerctionView: UICollectionView!

  var list = ["hanwha","lotte","nexen"]
  var locationData: [String: String] = ["":""]
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ViewController" {
      guard let nextVC = segue.destination as? ViewController else{return}
//      nextVC.locationData = 
    }
  }
}

extension MainViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      performSegue(withIdentifier: "ViewController", sender: self)
    }
  }
}


extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
    cell.cellImage.image = UIImage(named: "\(list[indexPath.row]).png")
    cell.clipsToBounds = true
    cell.cellImage.contentMode = .scaleAspectFit
    return cell
  }
  
  
}
