//
//  CommonAreaService.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import RxSwift

//지역조회
class CommonAreaService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = CommonAreaRPModel

    //지역조회 - 대분류
    func getAreaFirst()-> Observable<NetworkData> {
        let URL = CommonAreaService.serviceUrl(version: "/v1", path: "/area/first")
        return getable(URL: URL, body: nil)
    }
    
    //지역조회 - 중분류
    func getAreaSecond(body:[String:Any]?)-> Observable<NetworkData> {
        let URL = CommonAreaService.serviceUrl(version: "/v1", path: "/area/second")
        return getable(URL: URL, body: body)
    }
}
