//
//  AreaRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation

//지역조회 전용 모델
struct CommonAreaRPModel: Codable {
    let code:Int?
    let message: String?
    let dataList: [CommonAreaModel]?
}

struct CommonAreaModel: Codable {
    let area: String
    let areaName:String
    
    enum CodingKeys: String, CodingKey {
        case area
        case areaName = "area_name"
    }
}
