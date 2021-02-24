//
//  PlistService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/23.
//

import Foundation

//Plist 관리를 위한 파일
class PlistService {

    static let shareInstance = PlistService()
    
    func getSocialPlistInfo(keyName:String) -> String {
        var returnValue:String = ""
        if let config = getPlist(withName: "SocialKey") {
            // 키 값을 dictionary 조회하듯이 조회
            if let KAKAO_IOS_KEY = config[keyName]  as? String {
                returnValue = KAKAO_IOS_KEY
            }else if let APPLE_IOS_KEY = config[keyName]  as? String {
                returnValue = APPLE_IOS_KEY
            }
        }
        return returnValue
    }

    func getPlist(withName name: String) -> [String: Any]?
    {
        if  let path = Bundle.main.path(forResource: name , ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: Any]
        }
        return nil
    }

}
