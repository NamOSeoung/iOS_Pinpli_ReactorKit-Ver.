//
//  FAQView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//FAQ 전용 뷰
class FAQView: BaseView {
    
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
    lazy var headerBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var headerGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.text = "자주하는 질문"
        label.textAlignment = .center
        return label
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
    
    func addContentView() {
        addSubview(headerWrap)
        headerWrap.addSubview(backWrap)
        backWrap.addSubview(backBtnImage)
        headerWrap.addSubview(headerGL)
        headerWrap.addSubview(headerBottom)
    }
    
    func autoLayout() {
        headerWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 43)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(height)
        }
        backWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(currentViewSize.width/2)
        }
        backBtnImage.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 22)
            let leftRatio = constraintRatio(direction: .left, standardSize: 12)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
            make.height.equalTo(height)
        }
        headerGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 17)
            headerGL.font = headerGL.font.withSize(fontSize)
            make.centerX.centerY.equalToSuperview()
        }
        headerBottom.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            self?.backEvent.accept(true)
        }
    }
}
