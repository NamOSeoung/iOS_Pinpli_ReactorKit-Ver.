//
//  CommonAreaSearchRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation

//지역 검색 전용 모델
struct CommonAreaSearchRPModel: Codable {
    let code:Int?
    let message: String?
    let dataList: [String]?
}
