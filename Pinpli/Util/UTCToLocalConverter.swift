//
//  UTCToLocalConverter.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/16.
//

import Foundation

//UTC 시간 Local 현지시간으로 변환해주는 util
class UTCToLocalConverter {
    
    func utcToLocalConvert(timeStamp:Int) -> String{
        let timeInterval = TimeInterval(timeStamp)
        let writeDate = NSDate(timeIntervalSince1970: timeInterval)
        let calendar = Calendar.current
        let writeYear = calendar.component(.year, from: writeDate as Date)
        let writeMonth = calendar.component(.month, from: writeDate as Date)
        let writeDay = calendar.component(.day, from: writeDate as Date)
        return "\(writeYear).\(writeMonth).\(writeDay)"
    }
}
