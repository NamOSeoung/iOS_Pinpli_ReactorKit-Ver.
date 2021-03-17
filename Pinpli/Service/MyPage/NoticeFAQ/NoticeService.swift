//
//  NoticeService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift

//공지사항 질문 전용 서비스
class NoticeService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = NoticeRPModel

    func getNotice()-> Observable<NetworkData> {
        let URL = NoticeService.serviceUrl(version: "/v1", path: "/notices")
        
        return getable(URL: URL, body: nil)
    }
}
