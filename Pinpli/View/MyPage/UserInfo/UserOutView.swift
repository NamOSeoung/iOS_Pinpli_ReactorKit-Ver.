//
//  UserOutView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/08.
//

import UIKit
import SnapKit
import RxCocoa

//회원탈퇴 전용 뷰
class UserOutView: BaseView {

    
    lazy var closeWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeClickEvent(_:))))
        return view
    }()
    lazy var closeImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_24px")
        return image
    }()
    lazy var userOutGL01:UILabel = {
        let label = UILabel()
        label.text = "탈퇴 전 꼭 확인해주세요!"
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var userOutGL02:UILabel = {
        let label = UILabel()
        let lineSpacingRatio = aspectRatio(standardSize: 4)
        label.text = "작성한 리뷰와 Pin한 리뷰들이 모두 사라져요 😥\n재가입을 해도 데이터 복구는 불가해요"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.setLinespace(spacing: lineSpacingRatio)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    lazy var userOurConfirmWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var userOutNoWrap:UIView = {
        let view = UIView()
        view.tag = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userOutConfirmClickEvent(_:))))
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        return view
    }()
    lazy var userOutNoGL:UILabel = {
        let label = UILabel()
        label.text = "탈퇴 안할래요"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    lazy var userOutOkWrap:UIView = {
        let view = UIView()
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userOutConfirmClickEvent(_:))))
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    lazy var userOutOkGL:UILabel = {
        let label = UILabel()
        label.text = "탈퇴 할래요"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    var closeEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var userOutOkEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var userOutNoEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
        addSubview(userOutGL01)
        addSubview(userOutGL02)
        addSubview(userOurConfirmWrap)
        userOurConfirmWrap.addSubview(userOutOkWrap)
        userOutOkWrap.addSubview(userOutOkGL)
        userOurConfirmWrap.addSubview(userOutNoWrap)
        userOutNoWrap.addSubview(userOutNoGL)
    }
    
    private func autoLayout() {
        closeWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 110)
            let height = aspectRatio(standardSize: 43)
            make.leading.top.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        closeImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 24)
            make.width.height.equalTo(width)
            make.leading.equalTo(22)
            make.centerY.equalToSuperview()
        }
        userOutGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 30)
            let topRatio = constraintRatio(direction: .top, standardSize: 3)
            userOutGL01.font = userOutGL01.font.withSize(fontSize)
            make.top.equalTo(closeWrap.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        userOutGL02.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 19)
            let fontSize = aspectRatio(standardSize: 14)
            userOutGL02.font = userOutGL02.font.withSize(fontSize)
            make.top.equalTo(userOutGL01.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        userOurConfirmWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            let topRatio = constraintRatio(direction: .top, standardSize: 116)
            make.top.equalTo(userOutGL02.snp.bottom).offset(topRatio)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        userOutNoWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
        }
        userOutNoGL.snp.makeConstraints { (make) in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        userOutOkWrap.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(userOutNoWrap.snp.trailing)
            make.width.equalTo(userOutNoWrap.snp.width)
        }
        userOutOkGL.snp.makeConstraints { (make) in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    @objc private func closeClickEvent(_ gesture:UITapGestureRecognizer) {
        closeEvent.accept(true)
    }
    @objc private func userOutConfirmClickEvent(_ gesture:UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            if tag == 0 { //탈퇴 안할래요
                userOutNoEvent.accept(true)
            }else { //탈퇴 할래요
                userOutOkEvent.accept(true)
            }
        }
    }
}
