//
//  ReviewDetailSocialVIew.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/23.
//

import UIKit
import RxCocoa
import RxKeyboard
import RxSwift
import WebKit
import SwiftyTimer

class ReviewDetailSocialView: BaseView {
    
    lazy var webView:WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = .white
        return webView
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
    lazy var linkCopyWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkCopyClickEvent(_:))))
        return view
    }()
    lazy var linkCopyImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "copyOff")
        return image
    }()
    lazy var shareWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shareClickEvent(_:))))
        return view
    }()
    lazy var shareImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shareOff")
        return image
    }()
    lazy var reviewPinWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewPinClickEvent(_:))))
        return view
    }()
    lazy var reviewPinImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "reviewPinOff")
        return image
    }()
    lazy var blackListWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(blackListClickEvent(_:))))
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
        view.alpha = 0.0
        return view
    }()
    lazy var alertGL:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var linkCopyEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var shareEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var reviewPinEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var blackListEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
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
        addSubview(bottomViewWrap)
        bottomViewWrap.addSubview(bottomTopLine)
        bottomViewWrap.addSubview(linkCopyWrap)
        linkCopyWrap.addSubview(linkCopyImage)
        bottomViewWrap.addSubview(shareWrap)
        shareWrap.addSubview(shareImage)
        bottomViewWrap.addSubview(reviewPinWrap)
        reviewPinWrap.addSubview(reviewPinImage)
        bottomViewWrap.addSubview(blackListWrap)
        blackListWrap.addSubview(blackListImage)
        bottomViewWrap.addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
    }
    
    private func autoLayout() {
        bottomViewWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 49)
            make.height.equalTo(height)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
        bottomTopLine.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.top.trailing.equalToSuperview()
        }
        linkCopyWrap.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
        }
        linkCopyImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 75)
            let height = aspectRatio(standardSize: 49)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.centerX.equalToSuperview()
        }
        shareWrap.snp.makeConstraints{ make in
            make.leading.equalTo(linkCopyWrap.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(linkCopyWrap)
        }
        shareImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 75)
            let height = aspectRatio(standardSize: 49)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.centerX.equalToSuperview()
        }
        reviewPinWrap.snp.makeConstraints{ make in
            make.leading.equalTo(shareWrap.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(shareWrap)
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
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
    
    @objc private func linkCopyClickEvent(_ gesture:UITapGestureRecognizer) {
        linkCopyEvent.accept(true)
    }
    
    @objc private func shareClickEvent(_ gesture:UITapGestureRecognizer) {
        shareEvent.accept(true)
    }
    
    @objc private func reviewPinClickEvent(_ gesture:UITapGestureRecognizer) {
        reviewPinEvent.accept(true)
    }
    
    @objc private func blackListClickEvent(_ gesture:UITapGestureRecognizer) {
        blackListEvent.accept(true)
    }
    
    //웹뷰 화면 세팅
    func webViewSetting(url:String) {
        for view in subviews {
            if view == webView {
                view.removeFromSuperview()
            }
        }
        addSubview(webView)
        webView.snp.makeConstraints{ make in
            let url = URL(string: url)
            let request = URLRequest(url: url!)
            webView.load(request)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(bottomViewWrap.snp.top)
        }
    }
    
    //공유,복사 등 팝업 화면 세팅
    func alertPopCtrl(popupGubun:Int,flag:Bool) {
        for view in subviews {
            if view == alertWrap {
                view.removeFromSuperview()
            }
        }
        
        addSubview(alertWrap)
        alertWrap.addSubview(alertGL)

        if popupGubun == 0 { //작성자 블랙리스트 추가
            if flag { //추가
                alertGL.text = "이 작성자의 리뷰를 볼 수 없습니다 🙈"
            }else { //제거
                alertGL.text = "블랙리스트에서 삭제되었습니다 🙉"
            }
        }else if popupGubun == 1 { //게시물만 블랙리스트 추가
            if flag { //추가
                alertGL.text = "해당 게시물은 블랙리스트에 추가되었습니다"
            }else { //제거
                alertGL.text = "블랙리스트에서 삭제되었습니다 🙉"
            }
        }else if popupGubun == 2 { //리뷰 관련 추가제거
            if flag { //추가
                alertGL.text = "📌 리뷰를 Pin 하였습니다 📌"
            }else { //제거
                alertGL.text = "📌 리뷰 Pin을 뺐습니다 📌"
            }
        }else { //주소 링크
            alertGL.text = "링크 복사를 완료하였습니다"
        }
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.alertWrap.alpha = 1.0
        })
        
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
        
        let timer = Timer.new(every: 2.0.second) {}
        timer.start(modes: .tracking)
        Timer.every(2.0.second) { [weak self] (timer: Timer) in
            timer.invalidate()

            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.alertWrap.alpha = 0.0
            })
        }
    }
}
