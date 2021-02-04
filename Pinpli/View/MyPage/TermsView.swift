//
//  ServiceTermsView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/04.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//서비스 이용약관, 개인정보 처리방침 전용 뷰
class TermsView: BaseView {
    
    lazy var termsWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var headerGL:UILabel = {
        let label = UILabel()
        label.text = "서비스 이용 약관"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
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
    lazy var contentsTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus cursus aliquet et ultrices tempor laoreet ullamcorper amet. Nulla vitae volutpat integer fusce pretium nunc sed. Non laoreet feugiat sed vulputate libero commodo, nunc et, feugiat. Commodo convallis habitasse habitant in. Facilisi interdum mi augue bibendum posuere nunc, semper. Pharetra ac sed accumsan, nisi, in egestas orci cursus. Nullam consectetur faucibus elementum amet est non accumsan, auctor. Eget nulla et consequat eget leo ultrices. Facilisis feugiat nascetur cras pellentesque at at mi dictumst sit. Ante hac amet mi faucibus sit vitae. Vel sed malesuada semper rhoncus. Adipiscing duis posuere vel viverra ultricies ornare sed consequat sed. Mauris integer sit ac, quisque. Et, quam commodo est proin purus. Sed mi lacus arcu diam sollicitudin sit sodales in magna. Netus iaculis massa sed in cursus. Etiam lectus velit vestibulum tristique parturient mauris viverra eget molestie. Nibh quam interdum nunc nunc convallis amet ut. Ac phasellus tortor porta orci, eu placerat morbi senectus arcu. Nisl orci odio lorem ipsum risus. Posuere ultricies morbi augue nec tortor massa, nibh facilisi. Pharetra porttitor porttitor consequat enim pellentesque donec. Volutpat morbi magna consequat massa dignissim. Velit, pulvinar phasellus hendrerit arcu nunc facilisis aenean diam. Suspendisse auctor ipsum quis scelerisque facilisis pellentesque. Fermentum, cum pretium vehicula tellus facilisis. Fermentum nec purus lectus turpis. Diam pellentesque habitant et elementum sem nisi, mollis neque. Adipiscing congue faucibus dui faucibus ornare cras morbi.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus cursus aliquet et ultrices tempor laoreet ullamcorper amet. Nulla vitae volutpat integer fusce pretium nunc sed. Non laoreet feugiat sed vulputate libero commodo, nunc et, feugiat. Commodo convallis habitasse habitant in. Facilisi interdum mi augue bibendum posuere nunc, semper. Pharetra ac sed accumsan, nisi, in egestas orci cursus. Nullam consectetur faucibus elementum amet est non accumsan, auctor. Eget nulla et consequat eget leo ultrices. Facilisis feugiat nascetur cras pellentesque at at mi dictumst sit. Ante hac amet mi faucibus sit vitae. Vel sed malesuada semper rhoncus. Adipiscing duis posuere vel viverra ultricies ornare sed consequat sed. Mauris integer sit ac, quisque. Et, quam commodo est proin purus. Sed mi lacus arcu diam sollicitudin sit sodales in magna. Netus iaculis massa sed in cursus. Etiam lectus velit vestibulum tristique parturient mauris viverra eget molestie. Nibh quam interdum nunc nunc convallis amet ut. Ac phasellus tortor porta orci, eu placerat morbi senectus arcu. Nisl orci odio lorem ipsum risus. Posuere ultricies morbi augue nec tortor massa, nibh facilisi. Pharetra porttitor porttitor consequat enim pellentesque donec. Volutpat morbi magna consequat massa dignissim. Velit, pulvinar phasellus hendrerit arcu nunc facilisis aenean diam. Suspendisse auctor ipsum quis scelerisque facilisis pellentesque. Fermentum, cum pretium vehicula tellus facilisis. Fermentum nec purus lectus turpis. Diam pellentesque habitant et elementum sem nisi, mollis neque. Adipiscing congue faucibus dui faucibus ornare cras morbi."
        textView.textContainerInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        textView.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    var closeEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super .init(frame: frame)
        setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.3)
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        addSubview(termsWrap)
        termsWrap.addSubview(headerWrap)
        headerWrap.addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
        headerWrap.addSubview(headerGL)
        termsWrap.addSubview(contentsTextView)
    }
    
    func autoLayout() {
        termsWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 550)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.centerY.equalToSuperview()
        }
        headerWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 50)
            make.height.equalTo(height)
            make.leading.top.trailing.equalToSuperview()
        }
        headerGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let height = aspectRatio(standardSize: 22)
            let topRatio = constraintRatio(direction: .top, standardSize: 15)
            headerGL.font = headerGL.font.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.centerX.equalToSuperview()
        }
        closeWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(headerGL.snp.leading)
        }
        closeImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 24)
            let leftRatio = constraintRatio(direction: .left, standardSize: 20)
            make.width.height.equalTo(width)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
        }
        contentsTextView.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 60)
            let fontSize = aspectRatio(standardSize: 12)
            make.top.equalTo(topRatio)
            make.bottom.equalTo(-topRatio)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            contentsTextView.font = contentsTextView.font?.withSize(fontSize)
        }
    }

    @objc private func closeClickEvent(_ gesture:UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            self?.closeEvent.accept(true)
        }
    }
}
