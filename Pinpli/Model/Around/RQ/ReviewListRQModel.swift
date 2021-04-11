//
//  ReviewListRQModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

import Foundation

//플랫폼 별 리뷰조회 요청 모델
struct ReviewListRQModel: Codable {
    var provider: String //리뷰 제공 플랫폼 (YOUTUBE/NAVER/TISTORY/PINPLI)
    var page: Int? //페이지 번호
    var count: Int? //페이지 요소 갯수
    var latitude: Double? //위도
    var longitude: Double? //경도
}
