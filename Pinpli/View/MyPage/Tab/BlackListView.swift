//
//  BlackListView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/01.
//

import UIKit
import SnapKit

//블랙리스트 탭
class BlackListView: BaseView {
 
    lazy var blackListReviewGubunWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var youtubeWrap:UIView = {
        let view = UIView()
        view.tag = 0
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewTab(_:))))
        return view
    }()
    lazy var youtubeLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "youtube_logo")
        return image
    }()
    lazy var naverWrap:UIView = {
        let view = UIView()
        view.tag = 1
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewTab(_:))))
        return view
    }()
    lazy var naverLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "naver_logo")
        return image
    }()
    lazy var tistoryWrap:UIView = {
        let view = UIView()
        view.tag = 2
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewTab(_:))))
        return view
    }()
    lazy var tistoryLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tistory_logo")
        return image
    }()
    lazy var blackListReviewBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var reviewSelectBottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 51, g: 51, b: 51, alpha: 1)
        return view
    }()
    
    //작성자. 게시글 선택 감싸는 뷰
    lazy var blackListContentsSelectWrap:UIView = {
        let view = UIView()
        let cornerRadius = aspectRatio(standardSize: 44)/2
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1).cgColor
        return view
    }()
    lazy var blackListContentsSelectBackgroundWrap:UIView = {
        let view = UIView()
        let cornerRadius = aspectRatio(standardSize: 44)/2
        view.layer.cornerRadius = cornerRadius
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        return view
    }()
    lazy var writerWrap:UIView = {
        let view = UIView()
//        let cornerRadius = aspectRatio(standardSize: 44)/2
//        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .clear
//        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        return view
    }()
    lazy var writerGL:UILabel = {
        let label = UILabel()
        label.text = "작성자"
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
        return label
    }()
    lazy var postWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var postGL:UILabel = {
        let label = UILabel()
        label.text = "게시글"
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
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
        blackListReviewGubunWrap.addSubview(blackListReviewBottom)
        blackListReviewGubunWrap.addSubview(youtubeWrap)
        youtubeWrap.addSubview(youtubeLogoImage)
        blackListReviewGubunWrap.addSubview(naverWrap)
        naverWrap.addSubview(naverLogoImage)
        blackListReviewGubunWrap.addSubview(tistoryWrap)
        tistoryWrap.addSubview(tistoryLogoImage)
        blackListReviewGubunWrap.addSubview(reviewSelectBottomLine)
        blackListContentsSelectWrap.addSubview(blackListContentsSelectBackgroundWrap)
        blackListContentsSelectWrap.addSubview(writerWrap)
        writerWrap.addSubview(writerGL)
        blackListContentsSelectWrap.addSubview(postWrap)
        postWrap.addSubview(postGL)
    }
    
    private func autoLayout() {
        youtubeWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
        }
        naverWrap.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(youtubeWrap.snp.trailing)
            make.width.equalTo(youtubeWrap)
        }
        tistoryWrap.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(naverWrap.snp.trailing)
            make.width.equalTo(naverWrap)
        }
        youtubeLogoImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 30)
            make.width.height.equalTo(width)
            make.centerX.centerY.equalToSuperview()
        }
        naverLogoImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 30)
            make.width.height.equalTo(width)
            make.centerX.centerY.equalToSuperview()
        }
        tistoryLogoImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 30)
            make.width.height.equalTo(width)
            make.centerX.centerY.equalToSuperview()
        }
        reviewSelectBottomLine.snp.makeConstraints { (make) in
            make.leading.bottom.equalToSuperview()
            make.width.equalTo(currentViewSize.width/3)
            make.height.equalTo(5)
        }
        blackListReviewBottom.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        writerWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
        }
        writerGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            writerGL.font = writerGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        postWrap.snp.makeConstraints { (make) in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(writerWrap.snp.trailing)
            make.width.equalTo(writerWrap)
        }
        postGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            postGL.font = postGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        blackListContentsSelectBackgroundWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(writerWrap.snp.width)
        }
    }

    func reviewSelectBottomSetting(reviewGubun:Int) {
        
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            if reviewGubun == 0 { //유튜브
                self?.reviewSelectBottomLine.frame.origin.x = 0
            }else if reviewGubun == 1 { //네이버
                self?.reviewSelectBottomLine.frame.origin.x = (self?.currentViewSize.width ?? 375)/3
            }else { //티스토리
                self?.reviewSelectBottomLine.frame.origin.x = ((self?.currentViewSize.width ?? 375)/3 ) * 2
            }
        })
    }
    
    func blackListContentsSelectSetting(gubun:Int) {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            if gubun == 0 {
                self?.blackListContentsSelectBackgroundWrap.frame.origin.x = 0
                self?.writerGL.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
                self?.postGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
            }else {
                self?.blackListContentsSelectBackgroundWrap.frame.origin.x = (self?.writerWrap.frame.width ?? 0)
                self?.writerGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
                self?.postGL.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
            }
        })
        
    }
}
