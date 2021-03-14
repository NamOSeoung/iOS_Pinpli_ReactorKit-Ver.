//
//  HeaderCommon.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import Alamofire

//공통 헤더
class HeaderCommon {
    
    static let shareInstance = HeaderCommon()
    
    func headerSetting()-> HTTPHeaders{
        let requestUUID: String = UUID().uuidString.lowercased()

        var headers: HTTPHeaders = [
            "Content-Type":"application/json",
            "Accept":"application/json",
            "X-Request-Id":requestUUID
        ]
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            headers.add(name: "Authorization", value: accessToken)
        }

        return headers
    }
}
