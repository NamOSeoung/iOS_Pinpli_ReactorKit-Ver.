//
//  UIButton+extension.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit

extension UIButton {
    func setTitleColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat, ctrl:UIControl.State) {
        setTitleColor(UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha), for: ctrl)
    }
}
