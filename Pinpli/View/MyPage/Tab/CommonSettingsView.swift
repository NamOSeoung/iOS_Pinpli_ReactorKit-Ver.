//
//  CommonSettingsView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/01.
//

import UIKit
import SnapKit
import RxCocoa

//일반 설정 탭
class CommonSettingsView: BaseView {
   
    lazy var serviceTermsWrap:UIView = {
        let view = UIView()
        view.tag = 0
        return view
    }()
    lazy var serviceTermsGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "서비스 이용약관"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var serviceTermsGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = ">"
        label.textAlignment = .right
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var privacyTermsWrap:UIView = {
        let view = UIView()
        view.tag = 1
        return view
    }()
    lazy var privacyTermsGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "개인정보 처리방침"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var privacyTermsGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = ">"
        label.textAlignment = .right
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var faqWrap:UIView = {
        let view = UIView()
        view.tag = 2
        return view
    }()
    lazy var faqGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "자주하는 잘문"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var faqGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = ">"
        label.textAlignment = .right
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var noticeWrap:UIView = {
        let view = UIView()
        view.tag = 3
        return view
    }()
    lazy var noticeGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "공지사항"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var noticeGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = ">"
        label.textAlignment = .right
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var appInfoWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var appInfoGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "버젼 정보"
        label.textAlignment = .left
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        return label
    }()
    lazy var appInfoGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.textAlignment = .right
        label.text = "1.0.0"
        label.colorSetting(r: 172, g: 172, b: 172, alpha: 1)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        serviceTermsWrap.addSubview(serviceTermsGL01)
        serviceTermsWrap.addSubview(serviceTermsGL02)
        privacyTermsWrap.addSubview(privacyTermsGL01)
        privacyTermsWrap.addSubview(privacyTermsGL02)
        faqWrap.addSubview(faqGL01)
        faqWrap.addSubview(faqGL02)
        noticeWrap.addSubview(noticeGL01)
        noticeWrap.addSubview(noticeGL02)
        appInfoWrap.addSubview(appInfoGL01)
        appInfoWrap.addSubview(appInfoGL02)
    }
    
    private func autoLayout() {
        serviceTermsGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(22)
            serviceTermsGL01.font = serviceTermsGL01.font.withSize(fontSize)
        }
        serviceTermsGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            serviceTermsGL02.font = serviceTermsGL02.font.withSize(fontSize)
        }
        privacyTermsGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(22)
            privacyTermsGL01.font = privacyTermsGL01.font.withSize(fontSize)
        }
        privacyTermsGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            privacyTermsGL02.font = privacyTermsGL02.font.withSize(fontSize)
        }
        faqGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(22)
            faqGL01.font = faqGL01.font.withSize(fontSize)
        }
        faqGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            faqGL02.font = faqGL02.font.withSize(fontSize)
        }
        noticeGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(22)
            noticeGL01.font = noticeGL01.font.withSize(fontSize)
        }
        noticeGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            noticeGL02.font = noticeGL02.font.withSize(fontSize)
        }
        appInfoGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(22)
            appInfoGL01.font = appInfoGL01.font.withSize(fontSize)
        }
        appInfoGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            appInfoGL02.font = appInfoGL02.font.withSize(fontSize)
        }
    }
}
