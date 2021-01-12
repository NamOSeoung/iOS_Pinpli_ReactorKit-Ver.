//
//  PinPlaceView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import Foundation
import UIKit
import SnapKit

class PinPlaceView: BaseView {
   
    lazy var titleWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleGL: UILabel = {
        let label = UILabel()
        label.text = "Pin한 장소"
        label.textColor = colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return label
    }()
    
    lazy var titleBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var contentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    
//    
//    lazy var pinListTV: UITableView = {
//        let table = UITableView()
//        table.backgroundColor = .clear
//        return table
//    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)

        addSubview(titleWrap)
        titleWrap.addSubview(titleGL)
        addSubview(titleBorderBottom)
        addSubview(contentsView)
        
//        contentsView.addSubview(pinListTV)
        
        titleWrap.snp.makeConstraints{ make in
            let heightSize = aspectRatio(standardSize: 43)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.width.equalTo(snp.width)
            make.height.equalTo(heightSize)
        }
        
        titleGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 8)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 11)
            let fontSize = aspectRatio(standardSize: 17)
            
            make.top.equalTo(topRatio)
            make.bottom.equalTo(-bottomRatio)
            make.centerX.equalTo(titleWrap)
            titleGL.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        }
        
        titleBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(titleWrap.snp.bottom)
            make.height.equalTo(0.5)
            make.width.equalTo(snp.width)
        }
        
        contentsView.snp.makeConstraints{ make in
            make.top.equalTo(titleBorderBottom.snp.bottom).offset(0)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide).offset(0)
        }
        
       
//        loginGL.snp.makeConstraints{ make in
//            make.top.equalTo(0)
//        }
        
        
        
//        pinListTV.snp.makeConstraints{ make in
//            make.top.leading.trailing.bottom.equalTo(0)
//        }
       
    }
    
    //로그아웃 된 경우 세팅
    func logoutViewSetting(logoutView: LogoutView) {

        contentsView.addSubview(logoutView.loginWrap)
        logoutView.loginWrap.addSubview(logoutView.loginGL)
        logoutView.loginWrap.addSubview(logoutView.loginBtn)

        logoutView.loginWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 216)
            make.height.equalTo(132)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(topRatio)
        }

        logoutView.loginGL.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.height.equalTo(50)
            make.leading.trailing.equalTo(0)
        }

        logoutView.loginBtn.snp.makeConstraints{ make in
            make.top.equalTo(logoutView.loginGL.snp.bottom).offset(30)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(54)
        }
    }
}
