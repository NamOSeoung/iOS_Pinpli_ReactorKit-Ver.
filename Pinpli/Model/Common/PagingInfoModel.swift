//
//  PagingInfoModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

//페이지 정보 공통 모델
struct PagingInfoModel : Codable {
    
    let count : Int?
    let next : Bool?
    let page : Int?
    let totalCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case page = "page"
        case totalCount = "total_count"
    }
}
