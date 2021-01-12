//
//  PlaceListRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation

//장소 목록조회 전용 모델
struct PlaceListRPModel: Codable {
    let code:Int?
    let message: String?
    let dataList: [PlaceListModel]?
}

struct PlaceListModel : Codable {
    let appRating : String?
    let appReviewCount : String?
    let appThumbnail : String?
    let blogThumbnail : String?
    let categoryName : String?
    let daumBlogCount : String?
    let googlePlaceId : String?
    let googleRating : String?
    let appReviewRating : String?
    let googleReviewCount : String?
    let kakaoPlaceId : String?
    let latitude : String?
    let longitude : String?
    let naverBlogCount : String?
    let naverPlaceId : String?
    let openHours : String?
    let placeAddress : String?
    let placeId : String?
    let placeName : String?
    let roadPlaceAddress : String?
    let youtubeReviewCount : String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case appRating = "app_rating"
        case appReviewCount = "app_review_count"
        case appThumbnail = "app_thumbnail"
        case blogThumbnail = "blog_thumbnail"
        case categoryName = "category_name"
        case daumBlogCount = "daum_blog_count"
        case googlePlaceId = "google_place_id"
        case googleRating = "google_rating"
        case appReviewRating = "appreview_rating"
        case googleReviewCount = "google_review_count"
        case kakaoPlaceId = "kakao_place_id"
        case latitude = "latitude"
        case longitude = "longitude"
        case naverBlogCount = "naver_blog_count"
        case naverPlaceId = "naver_place_id"
        case openHours = "open_hours"
        case placeAddress = "place_address"
        case placeId = "place_id"
        case placeName = "place_name"
        case roadPlaceAddress = "road_place_address"
        case youtubeReviewCount = "youtube_review_count"
        case errorMessage = "error_message"
    }
}
