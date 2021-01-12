//
//  AroundStoreRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/04.
//

import Foundation

//내 주변 장소 목록조회 전용 모델
struct AroundStoreRPModel: Codable {
    let code:Int?
    let message: String?
    let dataList: [AroundStoreRPModelData]?
}

struct AroundStoreRPModelData : Codable {
    let appThumbnail : String?
    let appReviewRating : Float?
    let blogThumbnail : String?
    let categoryName : String?
    let googleRating : Float?
    let latitude : String?
    let longitude : String?
    let openHours : String?
    let placeAddress : String?
    let placeId : String?
    let placeName : String?
    let roadPlaceAddress : String?

    enum CodingKeys: String, CodingKey {
        case appThumbnail = "app_thumbnail"
        case appReviewRating = "appreview_rating"
        case blogThumbnail = "blog_thumbnail"
        case categoryName = "category_name"
        case googleRating = "google_rating"
        case latitude = "latitude"
        case longitude = "longitude"
        case openHours = "open_hours"
        case placeAddress = "place_address"
        case placeId = "place_id"
        case placeName = "place_name"
        case roadPlaceAddress = "road_place_address"
    }
}
