//
//  PlaceListService.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import RxSwift

//장소 목록 조회
class PlaceListService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = PlaceListRPModel

    //장소목록 조회
    func getPlaceList(params:[String:Any]?)-> Observable<NetworkData> {
        let URL = PlaceListService.serviceUrl(version: "/v1", path: "/places")
        return getable(URL: URL, body: params)
    }
}
