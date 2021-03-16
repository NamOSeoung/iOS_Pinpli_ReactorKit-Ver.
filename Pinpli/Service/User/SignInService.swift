//
//  SignInService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation
import RxSwift

//로그인(소셜) 전용 서비스
class SignInService:APIUrlService,APIRequestService,ModelToDictionary {
    
    typealias NetworkData = SignInRPModel

    func postUserSignIn(params: SignUpRQModel)-> Observable<NetworkData> {
        let URL = SignInService.serviceUrl(version: "/v1", path: "/auth/sign-in-with-social")
        let bodyParams = SignInService.modelToDictionary(model: params)
        return postable(URL: URL, body: bodyParams)
    }
}
