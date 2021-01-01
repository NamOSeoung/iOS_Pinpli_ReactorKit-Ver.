//
//  KakaoLocationAPIService.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/28.
//

import Foundation
import RxSwift

//Kakao 현재위치 조회
class KakaoLocationAPIService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = KakaoLocationRPModel

    //Kakao 현재위치 조회
    func getKakaoLocation(params:[String:Any]?)-> Observable<NetworkData> {
        let URL = PlaceListService.kakaoServiceUrl(version: "/v2", path: "/local/geo/coord2address")
        return getable(URL: URL, body: params)
    }
}
