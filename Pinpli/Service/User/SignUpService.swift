//
//  SignUpService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation
import RxSwift

//회원가입(소셜) 전용 서비스
class SignUpService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SuccessRPModel

    func postUserSignUp(params: SignUpRQModel)-> Observable<NetworkData> {
        let URL = SignUpService.serviceUrl(version: "/v1", path: "/auth/sing-up-with-social")
        let bodyParams = SignUpService.modelToDictionary(model: params)
        return postable(URL: URL, body: bodyParams)
    }
}
