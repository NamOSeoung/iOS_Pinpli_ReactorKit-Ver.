//
//  ReviewListService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

import Foundation
import RxSwift

//플랫폼별 리뷰 정보 리스트 관련 서비스
class ReviewListService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = ReviewListRPModel

    func getReviewList(params:ReviewListRQModel)-> Observable<NetworkData> {
        let URL = ReviewListService.serviceUrl(version: "/v1", path: "/main/reviews")
        let bodyParams = ReviewListService.modelToDictionary(model: params)
        
        return getable(URL: URL, body: bodyParams)
    }
}
