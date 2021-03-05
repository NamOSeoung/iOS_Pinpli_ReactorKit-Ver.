//
//  ReviewCollectionYoutubeCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/04.
//

import UIKit

//리뷰모아보기 유튜브 전용 Cell
class ReviewCollectionYoutubeCell: BaseTableCell {
 
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var logoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "youtube_logo")
        return image
    }()
    
    lazy var headerTitleGL:UILabel = {
        let label = UILabel()
        label.text = "유튜브 리뷰"
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        return label
    }()
    
    lazy var writeDateGL:UILabel = {
        let label = UILabel()
        label.text = "2020-01-01"
        label.textAlignment = .right
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        return label
    }()
    
    lazy var subjectGL:UILabel = {
        let label = UILabel()
        label.text = "남양주 별내 맛집 올리엔! 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주 ....."
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 13")
        return image
    }()
    
    lazy var bottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func addContentView() {
        addSubview(headerWrap)
        headerWrap.addSubview(logoImage)
        headerWrap.addSubview(headerTitleGL)
        headerWrap.addSubview(writeDateGL)
        addSubview(subjectGL)
        addSubview(thumbnailImage)
        addSubview(bottomLine)
    }
    
    private func autoLayout() {
        headerWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.height.equalTo(height)
            make.top.equalTo(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        logoImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 16)
            make.width.height.equalTo(width)
            make.leading.top.equalToSuperview()
        }
        headerTitleGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 12)
            let leftRatio = constraintRatio(direction: .left, standardSize: 8)
            headerTitleGL.font = headerTitleGL.font.withSize(fontSize)
            make.leading.equalTo(logoImage.snp.trailing).offset(leftRatio)
            make.centerY.equalToSuperview()
        }
        writeDateGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 12)
            writeDateGL.font = writeDateGL.font.withSize(fontSize)
            make.centerY.trailing.equalToSuperview()
        }
        subjectGL.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.height.equalTo(height)
            subjectGL.font = subjectGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(headerWrap.snp.bottom).offset(topRatio)
        }
        thumbnailImage.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 177)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
            make.bottom.equalTo(bottomLine.snp.top).offset(-bottomRatio)
        }
        bottomLine.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 10)
            make.height.equalTo(height)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}


