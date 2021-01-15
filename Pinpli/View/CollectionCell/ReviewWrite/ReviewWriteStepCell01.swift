//
//  ReviewWriteStepCell01.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit

//리뷰 작성화면 첫 번재 스탭  CollectionCell
class ReviewWriteStepCell01: BaseCollectionCell {
    lazy var titleWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.text = "이 집의 별점은 몇 점인가요?"
        label.textAlignment = .left
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var reviewWriteGL:UILabel = {
        let label = UILabel()
        label.text = "음식의 맛, 가게의 청결한 정도 등\n가게의 총점을 선택해주세요 :)"
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.setLinespace(spacing: 5)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        /* 타이틀 이미지 */
        addSubview(titleGL)
        addSubview(reviewWriteGL)
//        titleWrap.addSubview(titleGL)
        /* */
    }
    
    private func bindConstraints() {
      
        /* 타이틀 감싸는 뷰 */
        titleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 30)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalToSuperview()
            titleGL.font = titleGL.font.withSize(fontSize)
        }
        reviewWriteGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 19)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(titleGL.snp.bottom).offset(topRatio)
            reviewWriteGL.font = reviewWriteGL.font.withSize(fontSize)
        }
    }
}
