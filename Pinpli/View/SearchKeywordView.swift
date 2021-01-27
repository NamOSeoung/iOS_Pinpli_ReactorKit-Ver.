//
//  SearchKeywordView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import UIKit
import SnapKit

class SearchKeywordView: BaseView {
   
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var closeWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var closeGL:UILabel = {
        let label = UILabel()
        label.text = "닫기"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.textAlignment = .right
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.sizeToFit()
        return label
    }()
    lazy var keywordDelWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var keywordDelImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_keyword")
        return image
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
        addSubview(headerWrap)
        headerWrap.addSubview(headerBottom)
        headerWrap.addSubview(closeWrap)
        headerWrap.addSubview(keywordDelWrap)
        keywordDelWrap.addSubview(keywordDelImage)
        closeWrap.addSubview(closeGL)
    }
    private func autoLayout() {
        headerWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 43)
            make.height.equalTo(height)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
        }
        headerBottom.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        closeWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 60)
            make.width.equalTo(width)
            make.leading.top.bottom.equalToSuperview()
        }
        closeGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            let rightRatio = constraintRatio(direction: .right, standardSize: 8)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(-rightRatio)
            make.leading.equalToSuperview()
        }
        keywordDelWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 60)
            make.width.equalTo(width)
            make.trailing.top.bottom.equalToSuperview()
        }
        keywordDelImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            let leftRatio = constraintRatio(direction: .left, standardSize: 19)
            make.width.height.equalTo(width)
            make.leading.equalTo(leftRatio)
            make.top.equalTo(topRatio)
        }
    }
}

