//
//  ReviewWriteStepCell02.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit

//리뷰 작성화면 두 번재 스탭  CollectionCell
class ReviewWriteStepCell02: BaseCollectionCell {
    lazy var titleWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.text = "가게의 특징을 보여줄 수 있는 사진을 선택해 주세요"
        label.setLinespace(spacing: 5)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var addPhotoBtn:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_add_photo"), for: .normal)
        return button
    }()
    lazy var noPhotoWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var noPhotoGL:UILabel = {
        let label = UILabel()
        label.text = "사진은 안찍었어요"
        label.textAlignment = .center
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        return label
    }()
    lazy var noPhotoBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 189, g: 189, b: 189, alpha: 1)
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
        addSubview(addPhotoBtn)
        
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
        /* */
        /* 사진 업로드 버튼 */
        addPhotoBtn.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 19)
            let height = currentViewSize.width - 44
            make.top.equalTo(titleGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(height)
        }
        /* */
       
    }
    func noPhotoUISetting(x:CGFloat) {
        for view in subviews {
            if view == noPhotoWrap {
                for child in view.subviews {
                    child.removeFromSuperview()
                }
            }
        }
        
        addSubview(noPhotoWrap)
        noPhotoWrap.addSubview(noPhotoGL)
        noPhotoWrap.addSubview(noPhotoBottom)
        /* 사진 없음 */
        noPhotoWrap.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 40)
            let height = aspectRatio(standardSize: 24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
            make.bottom.equalToSuperview().offset(-(x+bottomRatio))
        }
        noPhotoGL.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        noPhotoBottom.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalTo(noPhotoGL)
            make.leading.equalTo(noPhotoGL)
            make.height.equalTo(1)
        }
        /* */
    }
}
