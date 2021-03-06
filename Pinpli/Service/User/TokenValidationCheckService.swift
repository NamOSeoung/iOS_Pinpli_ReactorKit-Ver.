//
//  TokenValidationCheckService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import JWTDecode
import RxSwift

//토큰 만료 체크를 위한 파일
class TokenValidationCheckService {
    
    static let shared = TokenValidationCheckService()
    
    //토큰 유효성 검사로직
    func tokenValidationCheck() -> Int{
        
        var returnValue:Int = 0
        let tokenIsEmpty:Bool = tokenIsEmptyCheck()
        let accessTokenCheck:Bool = getAccessTokenCheck(accessTokenExpireTime: getAccessTokenExpireTime())
        
        if tokenIsEmpty {
            if accessTokenCheck {
                returnValue = 2
            }else {
                returnValue = 1
            }
        }
        return returnValue
    }
    
    //토큰 내장 DB존재여부 체크
    func tokenIsEmptyCheck() -> Bool{
        var tokenExistFlag:Bool = false
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            tokenExistFlag = true
            print("accessToken:\(accessToken)")
            
        }
        
        return tokenExistFlag
    }
    
    //액세스 토큰 시간 가져오기 메서드
    func getAccessTokenExpireTime() -> Int {
        var returnAccessExpireTime:Int = 0
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            let accessJWT = try? decode(jwt: accessToken)
            if let accessExpireTime:Int = accessJWT?.body["exp"] as? Int {
                returnAccessExpireTime = accessExpireTime
            }
        }
        return returnAccessExpireTime
    }
    
    //액세스 토큰 만료시간 체크 메서드
    func getAccessTokenCheck(accessTokenExpireTime:Int) -> Bool {
        var expireFlag:Bool = false
        let dateGap:DateComponents = tokenDateSetting(tokenExpireTime: accessTokenExpireTime)
        if case let (year?, month?, date?, hour?, minute?, second?) = (dateGap.year, dateGap.month, dateGap.day, dateGap.hour, dateGap.minute, dateGap.second)
        {
            print("AccessTokenExpireTime : \(year)년 \(month)개월 \(date)일 \(hour)시간 \(minute)분 \(second)초 전")
            //            log.info("AccessTokenExpireTime : \(year)년 \(month)개월 \(date)일 \(hour)시간 \(minute)분 \(second)초 전")
            //액세스 토큰은 1시간 전부터 자동으로 갱신해주기 위해 체크함.
            //result - true : 토큰 유효, false : 토큰 만료
            if year <= 0 && month <= 0 && date <= 0 && hour <= 0 && minute <= 59 && second <= 59{
                expireFlag = false
            }else {
                expireFlag = true
            }
        }
        return expireFlag
    }
    
    //토큰 만료시간 체크 직전 비교 할 시간 체킹만 해주는 메서드 (리프레시 , 액세스 토큰 공통)
    func tokenDateSetting(tokenExpireTime:Int) -> DateComponents{
        let nowDate = Date()
        let timeInterval = TimeInterval(tokenExpireTime)
        let writeDate = NSDate(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let expireTime = dateFormatter.date(from: dateFormatter.string(from: writeDate as Date))
        let currentTime = dateFormatter.date(from: dateFormatter.string(from: nowDate))
        let calendar = Calendar.current
        let dateGap:DateComponents = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: currentTime!, to: expireTime!)
        
        return dateGap
    }
}
