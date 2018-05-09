//
//  BaseBallDataModel.swift
//  DaumMapProject
//
//  Created by 배지호 on 2018. 5. 3..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation
//좌표 -> 주소변환 (x , y)
struct BaseBallDataModel: Codable {
  var meta: TotalCount
  var documents: [AddressData]
}

struct TotalCount: Codable {
  var totalCount: Int
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
  }
}

struct AddressData: Codable {
  var roadAddress: RoadAddress
  var detailAddress: DetailAddress
  
  enum CodingKeys: String, CodingKey {
    case roadAddress = "road_address"
    case detailAddress = "address"
  }
}

struct RoadAddress: Codable {
  var addressName: String
  var regionOneDepthName: String
  var regionTwoDepthName: String
  var regionThreeDepthName: String
  var roadName: String
  var undergroundYn: String
  var mainBuildingNo: String
  var subBuildingNo: String
  var bildingName: String
  var zoneNo: String
  
  enum CodingKeys: String, CodingKey {
    case addressName = "address_name"
    case regionOneDepthName = "region_1depth_name"
    case regionTwoDepthName = "region_2depth_name"
    case regionThreeDepthName = "region_3depth_name"
    case roadName = "road_name"
    case undergroundYn = "underground_yn"
    case mainBuildingNo = "main_building_no"
    case subBuildingNo = "sub_building_no"
    case bildingName = "building_name"
    case zoneNo = "zone_no"
  }
}

struct DetailAddress: Codable {
  var addressName: String
  var regionOneDepthName: String
  var regionTwoDepthName: String
  var regionThreeDepthName: String
  var mountainYn: String
  var mainAddressNo: String
  var subAddressNo: String
  var zipCode: String
  
  enum CodingKeys: String, CodingKey {
    case addressName = "address_name"
    case regionOneDepthName = "region_1depth_name"
    case regionTwoDepthName = "region_2depth_name"
    case regionThreeDepthName = "region_3depth_name"
    case mountainYn = "mountain_yn"
    case mainAddressNo = "main_address_no"
    case subAddressNo = "sub_address_no"
    case zipCode = "zip_code"
  }
}
