//
//  AroundNaverCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/04.
//

import UIKit

//내 주변가게 네이버 정보 CollectionCell
class AroundNaverCell: BaseCollectionCell {
    
    lazy var thumbnailWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image7")
        return image
    }()
    
    lazy var descriptionInfoWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var descriptionGL:UILabel = {
        let label = UILabel()
        label.text = "#2 VLOG | 남양주 / 별내 / 카페거리 / ollien / 올리앤 / 빌리엔젤 / 다이소"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    
    lazy var writeDateWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var writeDateGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.text = "2020.08.30"
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
        /* 썸네일 */
        addSubview(thumbnailWrap)
        thumbnailWrap.addSubview(thumbnailImage)
        /* */
        
        /* 설명 */
        addSubview(descriptionInfoWrap)
        descriptionInfoWrap.addSubview(descriptionGL)
        /* */
        
        /* 작성일 */
        addSubview(writeDateWrap)
        writeDateWrap.addSubview(writeDateGL)
        /* */
    }
    
    private func bindConstraints() {
      
        /* 썸네일 */
        thumbnailWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 160)
            make.top.equalTo(0)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
        }
        
        thumbnailImage.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }

        /* */
        
        /* 설명 */
        descriptionInfoWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 18)
            make.top.equalTo(thumbnailWrap.snp.bottom).offset(10)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        
        descriptionGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            descriptionGL.font = descriptionGL.font.withSize(fontSize)
            make.leading.trailing.top.bottom.equalTo(0)
        }
        /* */
        
        /* 작성일 */
        writeDateWrap.snp.makeConstraints{ make in
            make.top.equalTo(descriptionInfoWrap.snp.bottom)
            make.leading.trailing.bottom.equalTo(0)
        }
        
        writeDateGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            writeDateGL.font = writeDateGL.font.withSize(fontSize)
            make.leading.trailing.top.bottom.equalTo(0)
        }
        /* */
    }
}
