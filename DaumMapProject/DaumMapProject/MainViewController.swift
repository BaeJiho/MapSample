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

  var list = [1, 2, 3, 4, 5, 6, 7, 8 ,9 , 10]
  var locationData: [String: String] = ["":""]
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }
}

extension MainViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "ViewController", sender: self)
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
