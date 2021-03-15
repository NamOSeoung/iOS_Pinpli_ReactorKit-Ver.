//
//  QuestionDeleteService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift

//1:1문의 리스트 삭제 전용 서비스
class QuestionDeleteService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SuccessRPModel

    func deleteQuestion(questionId:String)-> Observable<NetworkData> {
        let URL = QuestionListService.serviceUrl(version: "/v1", path: "/users/questions/\(questionId)")
        
        return deletaable(URL: URL, body: nil)
    }
}
