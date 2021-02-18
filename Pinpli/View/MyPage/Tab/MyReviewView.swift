//
//  MyReviewView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit

//내 리뷰 탭
class MyReviewView: BaseView {
    
    lazy var reviewIsEmptyWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var reviewIsEmptyGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.textAlignment = .center
        label.text = "🍟 😍 🍤"
        return label
    }()
    lazy var reviewIsEmptyGL02:UILabel = {
        let label = UILabel()
        let lineSpacingRatio = aspectRatio(standardSize: 8)
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        
        label.text = "아직 작성한 리뷰가 없어요\n마음에 드는 맛집의 리뷰를 작성해 보세요 :)"
        label.setLinespace(spacing: lineSpacingRatio)
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
        reviewIsEmptyWrap.addSubview(reviewIsEmptyGL01)
        reviewIsEmptyWrap.addSubview(reviewIsEmptyGL02)
    }
    
    private func autoLayout() {
        reviewIsEmptyGL01.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 25)
            reviewIsEmptyGL01.font = reviewIsEmptyGL01.font.withSize(fontSize)
            make.leading.top.trailing.equalToSuperview()
        }
        reviewIsEmptyGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(reviewIsEmptyGL01.snp.bottom).offset(topRatio)
            make.leading.trailing.equalToSuperview()
            reviewIsEmptyGL02.font = reviewIsEmptyGL02.font.withSize(fontSize)
        }
    }
}
