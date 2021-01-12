//
//  AroundStoreService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/04.
//

import Foundation
import RxSwift

//내 주변 가게 조회
class AroundStoreService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = AroundStoreRPModel

    func getAroundStoreList(params:[String:Any]?)-> Observable<NetworkData> {
        let URL = AroundStoreService.serviceUrl(version: "/v1", path: "/main/places")
        
        return getable(URL: URL, body: params)
    }
}
