//
//  ReviewWriteStepCell01.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit
import MGStarRatingView
//리뷰 작성화면 첫 번재 스탭  CollectionCell
class ReviewWriteStepCell01: BaseCollectionCell,StarRatingDelegate {
    func StarRatingValueChanged(view: StarRatingView, value: CGFloat) {
        
    }
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
        label.setLinespace(spacing: 3)
        return label
    }()
    
    lazy var starView:StarRatingView = {
        let view = StarRatingView()
        return view
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
        addSubview(starView)
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
        starView.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 116)
            let height = aspectRatio(standardSize: 33)
            let width = aspectRatio(standardSize: 31)
            let spacing = aspectRatio(standardSize: 13)
            make.centerX.equalToSuperview()
            make.top.equalTo(reviewWriteGL.snp.bottom).offset(topRatio)
            make.height.equalTo(height)
            
            let attribute = StarRatingAttribute(type: .rate,
                                                point: width,
                                                spacing: spacing,
                                                emptyColor: .clear,
                                                fillColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0),
                                                emptyImage: UIImage(named: "star_empty_24px"),
                                                fillImage: UIImage(named: "star_fill_24px"))
            starView.configure(attribute, current: 0, max: 5)
            
            starView.delegate = self
            starView.current = 0.0
        }
    }
}
