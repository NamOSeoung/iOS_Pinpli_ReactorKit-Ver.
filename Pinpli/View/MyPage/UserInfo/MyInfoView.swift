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
    lazy var bottomBtnWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 0.5)
        return view
    }()
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
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
            let height = aspectRatio(standardSize: 22)
            let leftRatio = constraintRatio(direction: .left, standardSize: 6)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
            make.height.equalTo(height)
        }

        headerGL.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        headerBottom.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
}
