//
//  AroundStoreCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/04.
//

import UIKit

//내 주변가게 상점 정보 CollectionCell
class AroundStoreCell: BaseCollectionCell {
    
    lazy var titleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    //카테고리
    lazy var categoryGL:UILabel = {
        let label = UILabel()
        label.text = "이탈리안 전문점전문점전문점"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    //영업상태
    lazy var openGL:UILabel = {
        let label = UILabel()
        label.text = "영업중"
        label.colorSetting(r: 111, g: 207, b: 151, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var thumbnailWrap:UIView = {
        let view = UIView()
//        view.backgroundColor = .green
        return view
    }()
    
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
//        image.isHidden = true
        image.image = UIImage(named: "image7")
        return image
    }()
    
    lazy var thumbnailIsNullImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thumbnail_is_null")
        image.isHidden = true
        return image
    }()
    
    lazy var storeInfoWrap: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.5)
        return view
    }()
    
    lazy var storeNameGL:UILabel = {
        let label = UILabel()
        label.text = "가장 맛있는 족발 가족가족가족"
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .right
        return label
    }()
    
    lazy var storeRatingGL:UILabel = {
        let label = UILabel()
        label.text = "★ 4.1"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.textAlignment = .right
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
//        backgroundColor = .white
        /* 타이틀 */
        addSubview(titleWrap)
        titleWrap.addSubview(categoryGL)
        titleWrap.addSubview(openGL)
        /* */
        
        /* 썸네일 */
        addSubview(thumbnailWrap)
        thumbnailWrap.addSubview(thumbnailImage)
        thumbnailWrap.addSubview(thumbnailIsNullImage)
        /* */
        /* 상점명, 평점 감싸는 뷰*/
        addSubview(storeInfoWrap)
        storeInfoWrap.addSubview(storeNameGL)
        storeInfoWrap.addSubview(storeRatingGL)
        /* */
        
    }
    
    private func bindConstraints() {
        /* 타이틀 */
        titleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 32)
            make.leading.top.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        categoryGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.leading.equalTo(0)
            make.trailing.equalTo(openGL.snp.leading).offset(-10)
            categoryGL.font = categoryGL.font.withSize(fontSize)
        }
        openGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.trailing.equalTo(0)
            openGL.font = openGL.font.withSize(fontSize)
            let width = ("영업중" as NSString).size(withAttributes: [NSAttributedString.Key.font : openGL.font ?? UIFont.systemFont(ofSize: fontSize,weight: UIFont.Weight.semibold)]).width
            make.width.equalTo(width+1)
        }
        /* */
        /* 썸네일 */
        thumbnailWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 170)
            make.top.equalTo(titleWrap.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        thumbnailImage.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
        thumbnailIsNullImage.snp.makeConstraints{ make in
            make.width.equalTo(43)
            make.height.equalTo(50)
            make.centerX.centerY.equalTo(thumbnailWrap)
        }
        /* */
        
        /* 상점명, 평점 감싸는 뷰*/
        storeInfoWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 43)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
            make.bottom.equalTo(thumbnailWrap.snp.bottom)
        }
        storeNameGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let height = aspectRatio(standardSize: 22)
            storeNameGL.font = storeNameGL.font.withSize(fontSize)
            make.height.equalTo(height)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        storeRatingGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            let height = aspectRatio(standardSize: 20)
            storeRatingGL.font = storeRatingGL.font.withSize(fontSize)
            make.height.equalTo(height)
            make.top.equalTo(storeNameGL.snp.bottom).offset(0)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        /* */
    }
}
