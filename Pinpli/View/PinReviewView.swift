//
//  PinReviewView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import Foundation
import UIKit
import SnapKit

class PinReviewView: BaseView {
    
    lazy var categoryWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var categoryAllWrap: UIView = {
        let view = UIView()
        return view
    }()
     
    lazy var categoryYoutubeWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var categoryNaverWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var categoryTistoryWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var allBtn: UIButton = {
        let button = UIButton()
        button.setTitle("전체", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        button.setTitleColor(colorSetting(r: 31, g: 31, b: 31, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(categoryTitleTap), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    lazy var youtubeBtn: UIButton = {
        let button = UIButton()
        button.setTitle("유튜브", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        button.setTitleColor(colorSetting(r: 189, g: 189, b: 189, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(categoryTitleTap), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    lazy var naverBtn: UIButton = {
        let button = UIButton()
        button.setTitle("네이버", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        button.setTitleColor(colorSetting(r: 189, g: 189, b: 189, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(categoryTitleTap), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    lazy var tistoryBtn: UIButton = {
        let button = UIButton()
        button.setTitle("티스토리", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        button.setTitleColor(colorSetting(r: 189, g: 189, b: 189, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(categoryTitleTap), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    lazy var categoryBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var contentsView: UIView = {
        let view = UIView()
        return view
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(categoryWrap)
        categoryWrap.addSubview(categoryAllWrap)
        categoryWrap.addSubview(categoryYoutubeWrap)
        categoryWrap.addSubview(categoryNaverWrap)
        categoryWrap.addSubview(categoryTistoryWrap)
        categoryAllWrap.addSubview(allBtn)
        categoryYoutubeWrap.addSubview(youtubeBtn)
        categoryNaverWrap.addSubview(naverBtn)
        categoryTistoryWrap.addSubview(tistoryBtn)
        addSubview(categoryBorderBottom)
        addSubview(contentsView)
        
        categoryWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 43)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        
        categoryAllWrap.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(0)
        }
    
        categoryYoutubeWrap.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(categoryAllWrap.snp.trailing).offset(0)
            make.width.equalTo(categoryAllWrap)
        }
        
        categoryNaverWrap.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(categoryYoutubeWrap.snp.trailing).offset(0)
            make.width.equalTo(categoryYoutubeWrap)
        }
        
        categoryTistoryWrap.snp.makeConstraints{ make in
            make.top.trailing.bottom.equalTo(0)
            make.leading.equalTo(categoryNaverWrap.snp.trailing).offset(0)
            make.width.equalTo(categoryNaverWrap)
        }
        
        allBtn.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.leading.top.trailing.bottom.equalTo(0)
            allBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        }
        
        youtubeBtn.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.leading.top.trailing.bottom.equalTo(0)
            youtubeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        }
        
        naverBtn.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.leading.top.trailing.bottom.equalTo(0)
            naverBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        }
        
        tistoryBtn.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.leading.top.trailing.bottom.equalTo(0)
            tistoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        }
        
        categoryBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(categoryWrap.snp.bottom).offset(0)
            make.width.equalTo(snp.width)
            make.height.equalTo(0.5)
        }

        
        contentsView.snp.makeConstraints{ make in
            make.top.equalTo(categoryBorderBottom.snp.bottom).offset(0)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide).offset(0)
        }
    }
    
    @objc private func categoryTitleTap(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            self?.categorySetting(tag: sender.tag)
        }
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
    
    func categorySetting(tag:Int) {
        allBtn.setTitleColor(r: 189, g: 189, b: 189, alpha: 1, ctrl: .normal)
        youtubeBtn.setTitleColor(r: 189, g: 189, b: 189, alpha: 1, ctrl: .normal)
        naverBtn.setTitleColor(r: 189, g: 189, b: 189, alpha: 1, ctrl: .normal)
        tistoryBtn.setTitleColor(r: 189, g: 189, b: 189, alpha: 1, ctrl: .normal)
        
        if tag == 0 {
            allBtn.setTitleColor(r: 0, g: 0, b: 0, alpha: 1, ctrl: .normal)
        }else if tag == 1 {
            youtubeBtn.setTitleColor(r: 0, g: 0, b: 0, alpha: 1, ctrl: .normal)
        }else if tag == 2 {
            naverBtn.setTitleColor(r: 0, g: 0, b: 0, alpha: 1, ctrl: .normal)
        }else {
            tistoryBtn.setTitleColor(r: 0, g: 0, b: 0, alpha: 1, ctrl: .normal)
        }
    }
}
