//
//  ReviewCollectionNaverImageTextCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/05.
//

import UIKit

//리뷰 모아보기 네이버 텍스트 + 이미지 존재 할 경우 셀
class ReviewCollectionNaverImageTextCell: BaseTableCell {
    
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var logoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "naver_logo")
        return image
    }()
    
    lazy var headerTitleGL:UILabel = {
        let label = UILabel()
        label.text = "네이버 리뷰"
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
        let lineSpace = aspectRatio(standardSize: 1)
        label.setLinespace(spacing: lineSpace)
        label.text = "남양주 별내 맛집 올리엔! 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주 맛집 / 남양주"
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    
    lazy var contentsWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 13")
        return image
    }()
    
    lazy var contentsTextGL:UILabel = {
        let label = UILabel()
        let lineSpace = aspectRatio(standardSize: 1)
        label.setLinespace(spacing: lineSpace)
        label.text = "올리앤 뭐 다들 아시죠?ㅎ가성비 좋아요~ 데이트하기 부담없고 괜찮으거 같아요 여친님이 파스타 먹고 싶다고해서 가게 되었어요~ 올리앤 뭐 다들 아시죠?ㅎ 가성비 좋아요~ 데이트하기 부담없부담없부담없부담없부담없부담없부담없"
        label.numberOfLines = 7
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.textAlignment = .left
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        return label
    }()
    
    lazy var writerGL:UILabel = {
        let label = UILabel()
        label.text = "일이삼사오육칠팔구십"
        label.numberOfLines = 1
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    lazy var viewCntGL:UILabel = {
        let label = UILabel()
        label.text = "조회수 227회"
        label.numberOfLines = 1
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .right
        return label
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
        addSubview(contentsWrap)
        contentsWrap.addSubview(thumbnailImage)
        contentsWrap.addSubview(contentsTextGL)
        contentsWrap.addSubview(writerGL)
        contentsWrap.addSubview(viewCntGL)
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

        contentsWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 140)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
        }
        
        thumbnailImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 180)
            make.width.equalTo(width)
            make.leading.top.bottom.equalToSuperview()
        }
        
        contentsTextGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 12)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 10)
            contentsTextGL.font = contentsTextGL.font.withSize(fontSize)
            make.bottom.equalTo(writerGL.snp.top).offset(-bottomRatio)
            make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
            make.top.trailing.equalToSuperview()
        }
        
        writerGL.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 67)
            let height = aspectRatio(standardSize: 16)
            let fontSize = aspectRatio(standardSize: 12)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
            make.bottom.equalToSuperview()
            writerGL.font = writerGL.font.withSize(fontSize)
        }

        viewCntGL.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 16)
            let fontSize = aspectRatio(standardSize: 12)
            make.leading.equalTo(writerGL.snp.trailing)
            make.height.equalTo(height)
            make.trailing.bottom.equalToSuperview()
            viewCntGL.font = viewCntGL.font.withSize(fontSize)
        }

        
        bottomLine.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 10)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            make.height.equalTo(height)
            make.top.equalTo(contentsWrap.snp.bottom).offset(topRatio)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}


