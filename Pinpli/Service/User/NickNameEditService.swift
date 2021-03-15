//
//  NickNameEditService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/14.
//

import Foundation
import RxSwift

//닉네임 변경 전용 서비스
class NickNameEditService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SuccessRPModel

    func putNickNameEdit(params: [String:String])-> Observable<NetworkData> {
        let URL = NickNameEditService.serviceUrl(version: "/v1", path: "/users/nickname")
        
        return putable(URL: URL, body: params)
    }
}
