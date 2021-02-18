//
//  ReviewDetailPinpliView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/22.
//

import UIKit
import RxCocoa
import RxKeyboard
import RxSwift

class ReviewDetailPinpliView: BaseView {
   
    lazy var headerViewWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var headerTitleGL:UILabel = {
        let label = UILabel()
        label.text = "닉네임자리일이삼사오 님의 리뷰"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.textAlignment = .center
        return label
    }()
    lazy var headerBottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        return scrollView
    }()
    lazy var bottomViewWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var bottomTopLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var reviewPinWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var reviewPinImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "reviewPinOff")
        return image
    }()
    lazy var blackListWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var blackListImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "blackListOff")
        return image
    }()
    lazy var closeWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
        return view
    }()
    lazy var closeImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "closeOff")
        return image
    }()

    
    lazy var alertWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.8)
        return view
    }()
    lazy var alertGL:UILabel = {
        let label = UILabel()
        label.text = "📌 리뷰를 Pin 하였습니다 📌"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var reviewGubun:Int = 0
    var reviewList:[Int] = [0,1,2]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(headerViewWrap)
        headerViewWrap.addSubview(headerTitleGL)
        headerViewWrap.addSubview(headerBottomLine)
        addSubview(bottomViewWrap)
        bottomViewWrap.addSubview(bottomTopLine)
        bottomViewWrap.addSubview(reviewPinWrap)
        reviewPinWrap.addSubview(reviewPinImage)
        bottomViewWrap.addSubview(blackListWrap)
        blackListWrap.addSubview(blackListImage)
        bottomViewWrap.addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
        /* 알림팝업 */
        addSubview(alertWrap)
        alertWrap.addSubview(alertGL)
        /* */
    }
    
    private func autoLayout() {
        headerViewWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 43)
            make.height.equalTo(height)
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
        }
        headerTitleGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 7)
            let height = aspectRatio(standardSize: 24)
            let fontSize = aspectRatio(standardSize: 17)
            make.top.equalTo(topRatio)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
            headerTitleGL.font = headerTitleGL.font.withSize(fontSize)
        }
        headerBottomLine.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        bottomViewWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 49)
            make.height.equalTo(height)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
        bottomTopLine.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.top.trailing.equalToSuperview()
        }
        reviewPinWrap.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
        }
        reviewPinImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 75)
            let height = aspectRatio(standardSize: 49)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.centerX.equalToSuperview()

        }
        blackListWrap.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(reviewPinWrap.snp.trailing)
            make.width.equalTo(reviewPinWrap)
        }
        blackListImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 75)
            let height = aspectRatio(standardSize: 49)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.centerX.equalToSuperview()
        }
        closeWrap.snp.makeConstraints{ make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(blackListWrap.snp.trailing)
            make.width.equalTo(blackListWrap)
        }
        closeImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 75)
            let height = aspectRatio(standardSize: 49)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.centerX.equalToSuperview()
        }
        alertWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 44)
            let bottomRatio = aspectRatio(standardSize: 30)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.bottom.equalTo(bottomViewWrap.snp.top).offset(-bottomRatio)
        }
        alertGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            alertGL.font = alertGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
}
