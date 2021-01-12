//
//  CommonAreaSearchService.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import RxSwift

//지역검색
class CommonAreaSearchService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = CommonAreaSearchRPModel

    //지역검색
    func getAreaSearch()-> Observable<NetworkData> {
        let URL = CommonAreaService.serviceUrl(version: "/v1", path: "/area/suggest")
        return getable(URL: URL, body: nil)
    }
}
