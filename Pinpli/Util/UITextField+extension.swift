//
//  UITextField+extension.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit

extension UITextField {
    
    //컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        textColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
