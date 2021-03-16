//
//  TokenRenewalService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation
import RxSwift

//토큰 갱신 전용 서비스
class TokenRenewalService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SignInRPModel

    func postTokenRenewal(params: [String:String])-> Observable<NetworkData> {
        let URL = TokenRenewalService.serviceUrl(version: "/v1", path: "/auth/refresh")
        return postable(URL: URL, body: params)
    }
}
