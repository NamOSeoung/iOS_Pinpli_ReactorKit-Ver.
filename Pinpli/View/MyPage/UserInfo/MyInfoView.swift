//
//  MyInfoView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import SnapKit
import RxCocoa

//내정보 관리 전용 뷰
class MyInfoView: BaseView {
    
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var backWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
        return view
    }()
    lazy var backBtnImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back_189")
        return image
    }()
    lazy var headerGL:UILabel = {
        let label = UILabel()
        label.text = "내정보 관리"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    lazy var headerBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 2)
        return view
    }()
    lazy var connectSocialWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var connectSocialGL01:UILabel = {
        let label = UILabel()
        label.text = "연결된 소셜 계정"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    lazy var connectSocialGL02:UILabel = {
        let label = UILabel()
        label.text = "카카오톡"
        label.textAlignment = .right
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var emailWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var emailGL01:UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    lazy var emailGL02:UILabel = {
        let label = UILabel()
        label.text = "developernam92@gmail.com"
        label.textAlignment = .right
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var bottomBtnWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 0.5)
        return view
    }()
    //로그아웃하기
    lazy var logoutWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logoutClickEvent(_:))))
        return view
    }()
    lazy var logoutGL:UILabel = {
        let label = UILabel()
        label.text = "로그아웃하기"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    //탈퇴하기
    lazy var userOutWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userOutClickEvent(_:))))
        return view
    }()
    lazy var userOutGL:UILabel = {
        let label = UILabel()
        label.text = "탈퇴하기"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var logoutEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var userOutEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        addSubview(headerWrap)
        headerWrap.addSubview(backWrap)
        backWrap.addSubview(backBtnImage)
        headerWrap.addSubview(headerGL)
        headerWrap.addSubview(headerBottom)
        addSubview(connectSocialWrap)
        connectSocialWrap.addSubview(connectSocialGL01)
        connectSocialWrap.addSubview(connectSocialGL02)
        addSubview(emailWrap)
        emailWrap.addSubview(emailGL01)
        emailWrap.addSubview(emailGL02)
        
        addSubview(bottomBtnWrap)
        bottomBtnWrap.addSubview(logoutWrap)
        logoutWrap.addSubview(logoutGL)
        bottomBtnWrap.addSubview(userOutWrap)
        userOutWrap.addSubview(userOutGL)
    }
    
    private func autoLayout() {
        headerWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 43)
            make.height.equalTo(height)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
        }
        backWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 110)
            make.width.equalTo(width)
            make.leading.top.bottom.equalToSuperview()
        }
        backBtnImage.snp.makeConstraints { (make) in
//            let height = aspectRatio(standardSize: 22)
            let leftRatio = constraintRatio(direction: .left, standardSize: 6)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
//            make.height.equalTo(height)
        }
        headerGL.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        headerBottom.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        connectSocialWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 73)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerWrap.snp.bottom)
            make.height.equalTo(height)
        }
        connectSocialGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            connectSocialGL01.font = connectSocialGL01.font.withSize(fontSize)
            make.centerY.equalToSuperview()
            make.leading.equalTo(22)
        }
        connectSocialGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            connectSocialGL02.font = connectSocialGL02.font.withSize(fontSize)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-22)
        }
        emailWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 4)
            let height = aspectRatio(standardSize: 73)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(connectSocialWrap.snp.bottom).offset(topRatio)
        }
        emailGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            emailGL01.font = emailGL01.font.withSize(fontSize)
            make.centerY.equalToSuperview()
            make.leading.equalTo(22)
        }
        emailGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            emailGL02.font = emailGL02.font.withSize(fontSize)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-22)
        }
        bottomBtnWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 96)
            make.height.equalTo(height)
            make.leading.bottom.trailing.equalToSuperview()
        }
        logoutWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
        }
        userOutWrap.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(logoutWrap.snp.trailing)
            make.width.equalTo(logoutWrap.snp.width)
        }
        logoutGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 12)
            let topRatio = constraintRatio(direction: .top, standardSize: 26)
            make.top.equalTo(topRatio)
            make.leading.trailing.equalToSuperview()
            logoutGL.font = logoutGL.font.withSize(fontSize)
        }
        userOutGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 12)
            let topRatio = constraintRatio(direction: .top, standardSize: 26)
            make.top.equalTo(topRatio)
            make.leading.trailing.equalToSuperview()
            userOutGL.font = userOutGL.font.withSize(fontSize)
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
    @objc private func logoutClickEvent(_ gesture:UITapGestureRecognizer) {
        logoutEvent.accept(true)
    }
    @objc private func userOutClickEvent(_ gesture:UITapGestureRecognizer) {
        userOutEvent.accept(true)
    }
}
