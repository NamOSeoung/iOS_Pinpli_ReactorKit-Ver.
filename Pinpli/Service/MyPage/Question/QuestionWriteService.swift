//
//  QuestionWriteService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift

//1:1문의 작성 전용 서비스
class QuestionWriteService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SuccessRPModel

    func postQuestionWrite(params:[String:String])-> Observable<NetworkData> {
        let URL = QuestionWriteService.serviceUrl(version: "/v1", path: "/users/questions")
        
        return postable(URL: URL, body: params)
    }
}
