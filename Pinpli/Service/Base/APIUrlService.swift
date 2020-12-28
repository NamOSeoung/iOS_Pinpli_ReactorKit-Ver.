//
//  APIUrlService.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation

protocol APIUrlService {}

extension APIUrlService {
    static func serviceUrl(version: String,path: String) -> String {
        //개발
        return "http://13.209.223.124:8080" + version + path
    }
    
    //카카오 API 요청 서버
    static func kakaoServiceUrl(version: String, path: String) -> String {
        return "https://dapi.kakao.com" + version + path
    }
}
