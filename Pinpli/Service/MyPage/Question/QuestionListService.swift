//
//  QuestionListService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift

//1:1문의 리스트 조회 전용 서비스
class QuestionListService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = QuestionListRPModel

    func getQuestionList()-> Observable<NetworkData> {
        let URL = QuestionListService.serviceUrl(version: "/v1", path: "/users/questions")
        
        return getable(URL: URL, body: nil)
    }
}
