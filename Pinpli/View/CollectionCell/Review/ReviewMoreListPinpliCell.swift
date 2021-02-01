//
//  ReviewMoreListPinpliCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/22.
//

import UIKit

//리뷰더보기 핀플리 전용 Cell
class ReviewMoreListPinpliCell: BaseTableCell {
    
    lazy var headerViewWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var profileImageWrap:UIView = {
        let view = UIView()
        view.layer.masksToBounds = true //이부분 설정 시 이 안에 addSubView하는 모든 뷰는 이 테두리안에서 논다.
        view.backgroundColor = .blue
        return view
    }()
    lazy var profileImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "image7")
        return image
    }()
    
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.text = "여긴 상점이다으다으"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var ratingGL:UILabel = {
        let label = UILabel()
        label.text = "★ 4/5 점"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var writeDateGL:UILabel = {
        let label = UILabel()
        label.text = "4개월 전"
        label.colorSetting(r: 134, g: 134, b: 134, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        return label
    }()

    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "image7")
        return image
    }()
    lazy var thumbnailImageCntWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.5)
        return view
    }()
    lazy var thumbnailImageCntGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "+ 3"
        return label
    }()
    lazy var contentsTextView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        textView.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textView.isEditable = false
        textView.isSelectable = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    lazy var cellBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setup()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        /* 헤더 */
        addSubview(headerViewWrap)
        headerViewWrap.addSubview(profileImageWrap)
        profileImageWrap.addSubview(profileImage)
        headerViewWrap.addSubview(titleGL)
        headerViewWrap.addSubview(ratingGL)
        headerViewWrap.addSubview(writeDateGL)
        addSubview(cellBottom)
        /* */
    }
    
    private func bindConstraints() {
        headerViewWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 20)
            make.height.equalTo(height)
            make.leading.equalTo(23)
            make.trailing.equalTo(-23)
            make.top.equalTo(topRatio)
        }
        profileImageWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 20)
            make.width.height.equalTo(width)
            make.top.bottom.leading.equalToSuperview()
            profileImageWrap.layer.cornerRadius = width/2
        }
        profileImage.snp.makeConstraints{ make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        titleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            make.left.equalTo(profileImageWrap.snp.right).offset(8)
            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
            titleGL.font = titleGL.font.withSize(fontSize)
        }
        ratingGL.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 54)
            let fontSize = aspectRatio(standardSize: 14)
            make.top.centerY.equalToSuperview()
            make.leading.equalTo(titleGL.snp.trailing).offset(4)
            make.width.equalTo(width)
            ratingGL.font = ratingGL.font.withSize(fontSize)
        }
        writeDateGL.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 44)
            let fontSize = aspectRatio(standardSize: 12)
            make.width.equalTo(width)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            writeDateGL.font = writeDateGL.font.withSize(fontSize)
        }
        cellBottom.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
            make.bottom.equalToSuperview()
        }
    }
    
    func rowDataSetting() {
        let testIndex:Int = 2
        
        for view in subviews {
            if view == thumbnailImage || view == contentsTextView || view == thumbnailImageCntWrap || view == thumbnailImageCntGL{
                view.removeFromSuperview()
            }
        }
        
       
        
        if testIndex == 0 { //이미지, 텍스트 둘다 존재
            addSubview(thumbnailImage)
            addSubview(contentsTextView)
            thumbnailImage.addSubview(thumbnailImageCntWrap)
            thumbnailImageCntWrap.addSubview(thumbnailImageCntGL)
            thumbnailImage.snp.makeConstraints{ make in
                let height = CGFloat(Int(currentViewSize.width - 46))
                let topRatio = constraintRatio(direction: .top, standardSize: 12)
                make.top.equalTo(headerViewWrap.snp.bottom).offset(topRatio)
                make.height.equalTo(height)
                make.leading.equalTo(23)
                make.trailing.equalTo(-23)
            }
            thumbnailImageCntWrap.snp.makeConstraints{ make in
                let width = aspectRatio(standardSize: 45)
                let height = aspectRatio(standardSize: 24)
                make.top.equalTo(12)
                make.trailing.equalTo(-12)
                make.width.equalTo(width)
                make.height.equalTo(height)
                thumbnailImageCntWrap.layer.cornerRadius = height/2
            }
            thumbnailImageCntGL.snp.makeConstraints{ make in
                let fontSize = aspectRatio(standardSize: 16)
                make.leading.top.bottom.trailing.equalToSuperview()
                thumbnailImageCntGL.font = thumbnailImageCntGL.font.withSize(fontSize)
            }
            contentsTextView.snp.makeConstraints{ make in
                let height = aspectRatio(standardSize: 42)
                make.height.equalTo(height)
                make.top.equalTo(thumbnailImage.snp.bottom).offset(12)
                make.leading.equalTo(23)
                make.trailing.equalTo(-23)
                make.bottom.equalTo(cellBottom.snp.top).offset(-20)
                contentsTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit ac habitant amet dignissim sit ..."
            }
        }else if testIndex == 1 { //이미지만 존재
            addSubview(thumbnailImage)
            thumbnailImage.addSubview(thumbnailImageCntWrap)
            thumbnailImageCntWrap.addSubview(thumbnailImageCntGL)
            thumbnailImage.snp.makeConstraints{ make in
                let height = CGFloat(Int(currentViewSize.width - 46))
                let topRatio = constraintRatio(direction: .top, standardSize: 12)
                make.top.equalTo(headerViewWrap.snp.bottom).offset(topRatio)
                make.height.equalTo(height)
                make.leading.equalTo(23)
                make.trailing.equalTo(-23)
                make.bottom.equalTo(cellBottom.snp.top).offset(-20)
            }
        }else { //텍스트만 존재
            addSubview(contentsTextView)
            contentsTextView.snp.makeConstraints{ make in
                let height = aspectRatio(standardSize: 126)
                make.height.equalTo(height)
                make.top.equalTo(headerViewWrap.snp.bottom).offset(20)
                make.leading.equalTo(23)
                make.trailing.equalTo(-23)
                make.bottom.equalTo(cellBottom.snp.top).offset(-20)
                contentsTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing et, sed eu senectus varius duis leo. Diam orci cursus sit interdum. Vitae volutpat, morbi ipsum, sed viverra dictum amet ut. Sit tincidunt integer sit felis enim fermentum cursus. Scelerisque commodo aliquet elementum..."
            }
        }
    }
}
