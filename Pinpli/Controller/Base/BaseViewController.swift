//
//  BaseViewController.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/24.
//

import UIKit
import SnapKit
import RxSwift

class BaseViewController: UIViewController,ColorSetting {
    var currentViewSize = UIScreen.main.bounds
    let standardWidthSize:CGFloat = 375  //디자인 기준 width
    let standardHeightSize:CGFloat = 812 //디자인 기준 height
    
    //constraint 방향 기준
    enum Direction {
        case top
        case left
        case right
        case bottom
    }
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }

    //변경할 관계 비율
    func constraintRatio(direction:Direction,standardSize:CGFloat) -> CGFloat{
        var ratio: CGFloat = 0.0
        
        switch direction {
        case .top,.bottom:
            let standardRatio = (standardSize/standardHeightSize)
            ratio = currentViewSize.height * standardRatio
            break
        case .left,.right:
            let standardRatio = (standardSize/standardWidthSize)
            ratio = currentViewSize.width * standardRatio
            break
        }
        
        
        return ratio
    }
    
    //변경할 비율 (view, font)
    func aspectRatio(standardSize:CGFloat) -> CGFloat {
        var ratio: CGFloat = 0.0
        
        let standardRatio = (standardSize/standardWidthSize)
        ratio = currentViewSize.width * standardRatio
        
        return ratio
    }
    
    //컬러 간편 세팅
    func colorSetting(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
