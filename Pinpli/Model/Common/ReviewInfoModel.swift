//
//  ReviewInfoModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

//리뷰 정보 공통 모델
struct ReviewInfoModel : Codable {
    let author : String?
    let description : String?
    let thumbnail : String?
    let placeId : String?
    let reviewCreatedAt : Int?
    let reviewId : String?
    let reviewProvider : String?
    let reviewViewCount : Int?
    let score : Float?
    let subject : String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case description = "description"
        case thumbnail = "thumbnail"
        case placeId = "place_id"
        case reviewCreatedAt = "review_created_at"
        case reviewId = "review_id"
        case reviewProvider = "review_provider"
        case reviewViewCount = "review_view_count"
        case score = "score"
        case subject = "subject"
    }
}
