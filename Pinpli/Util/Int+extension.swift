//
//  Int+extension.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

import Foundation


extension Int {
    func timeStampToLocalTime() -> String{
        let timeStamp = TimeInterval(self)
        
        let formatter = DateFormatter()

        formatter.timeZone = TimeZone.current

        formatter.dateFormat = "yyyy-MM-dd"
        
        let myDate = NSDate(timeIntervalSince1970: timeStamp)
        
        let dateString = formatter.string(from: myDate as Date)
        
        return dateString
    }
}
