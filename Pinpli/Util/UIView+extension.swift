//
//  UIView+extension.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit

public extension UIView {
    //버튼 클릭 시 애니메이션
    func showAnimation(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
                        self?.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                       }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                            self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                           }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
                       }
    }
    
    func setBackgroundColor(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) {
        backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    //그라데이션
    func addGradientWithColor(firstColor:UIColor,lastColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, lastColor.cgColor]
        
        layer.insertSublayer(gradient, at: 0)
    }
}
