//
//  FAQService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift

//자주하는 질문 전용 서비스
class FAQService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = FAQRPModel

    func getFAQ()-> Observable<NetworkData> {
        let URL = FAQService.serviceUrl(version: "/v1", path: "/users/faqs")
        
        return getable(URL: URL, body: nil)
    }
}
