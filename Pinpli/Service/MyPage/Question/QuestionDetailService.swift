//
//  QuestionDetailService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/16.
//

import Foundation
import RxSwift

//1:1문의 상세 전용 서비스
class QuestionDetailService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = QuestionDetailRPModel

    func getQuestionDetail(questionId:String)-> Observable<NetworkData> {
        let URL = QuestionDetailService.serviceUrl(version: "/v1", path: "/users/questions/\(questionId)")
        
        return getable(URL: URL, body: nil)
    }
}
