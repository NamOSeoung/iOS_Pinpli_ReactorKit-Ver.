//
//  SearchKeywordView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SearchKeywordViewUI: BaseView {
   
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var headerBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var closeBtn:UIButton = {
        let button = UIButton()
        button.setTitle("닫기", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 22, bottom: 11, right: 10)
        button.setTitleColor(r: 31, g: 31, b: 31, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return button
    }()
    lazy var keywordWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var keywordGL:UILabel = {
        let label = UILabel()
        label.text = "곱창, 신촌 + 곱창”으로 검색이 가능해요!"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    lazy var keywordTF:UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        textField.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textField.textAlignment = .center
        return textField
    }()
    lazy var keywordDelBtn:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "clear_keyword"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 9, left: 19, bottom: 12, right: 17)
        button.contentHorizontalAlignment = .center //버튼 좌우 정렬
        return button
    }()
    lazy var keywordSelectWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var hotKeywordWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var hotKeywordBtn:UIButton = {
        let button = UIButton()
        button.setTitle("요즘 핫한 키워드는?", for: .normal)
        button.contentHorizontalAlignment = .center //버튼 좌우 정렬
        button.setTitleColor(r: 51, g: 51, b: 51, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()
    lazy var recentlyKeywordWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var recentlyKeywordBtn:UIButton = {
        let button = UIButton()
        button.setTitle("최근 검색한 키워드", for: .normal)
        button.contentHorizontalAlignment = .center //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()
    lazy var keywordSelectBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 51, g: 51, b: 51, alpha: 1)
        return view
    }()
    lazy var keywordListTV:UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(AreaSecondCell.self,
                       forCellReuseIdentifier: "AreaSecondCell")
        return table
    }()
    
    weak var keywordSelectHeight:NSLayoutConstraint!
    
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
        headerWrap.addSubview(closeBtn)
        headerWrap.addSubview(keywordWrap)
        keywordWrap.addSubview(keywordGL)
        keywordWrap.addSubview(keywordTF)
        headerWrap.addSubview(keywordDelBtn)
        addSubview(keywordSelectWrap)
        keywordSelectWrap.addSubview(hotKeywordWrap)
        hotKeywordWrap.addSubview(keywordSelectBottom)
        hotKeywordWrap.addSubview(hotKeywordBtn)
        keywordSelectWrap.addSubview(recentlyKeywordWrap)
        recentlyKeywordWrap.addSubview(recentlyKeywordBtn)
        addSubview(keywordListTV)
        
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
        
        closeBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 17)
            let width = aspectRatio(standardSize: 60)
            make.width.equalTo(width)
            make.leading.top.bottom.equalToSuperview()
            closeBtn.titleLabel?.font = closeBtn.titleLabel?.font.withSize(fontSize)
        }
        keywordWrap.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(closeBtn.snp.trailing)
            make.trailing.equalTo(keywordDelBtn.snp.leading)
        }
        keywordGL.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            let leftRatio = constraintRatio(direction: .left, standardSize: 2)
            let fontSize = aspectRatio(standardSize: 16)
            keywordGL.font = keywordGL.font.withSize(fontSize)
            
            make.top.equalTo(topRatio)
            make.leading.equalTo(leftRatio)
            make.trailing.equalToSuperview()
        }
        keywordTF.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            let leftRatio = constraintRatio(direction: .left, standardSize: 2)
            let fontSize = aspectRatio(standardSize: 16)
            keywordTF.font = keywordTF.font?.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.leading.equalTo(leftRatio)
            make.trailing.equalToSuperview()
        }
        keywordDelBtn.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 60)
            make.width.equalTo(width)
            make.trailing.top.bottom.equalToSuperview()
        }

        /* 키워드 모드 선택 뷰 */
        keywordSelectWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 52)
            keywordSelectHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.top.equalTo(headerWrap.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        hotKeywordWrap.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview()
        }
        keywordSelectBottom.snp.makeConstraints { (make) in
            make.height.equalTo(5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        hotKeywordBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.left.top.trailing.bottom.equalToSuperview()
            hotKeywordBtn.titleLabel?.font = hotKeywordBtn.titleLabel?.font.withSize(fontSize)
        }
        
        recentlyKeywordWrap.snp.makeConstraints { (make) in
            make.leading.equalTo(hotKeywordWrap.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(hotKeywordWrap)
        }
        recentlyKeywordBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            recentlyKeywordBtn.titleLabel?.font = recentlyKeywordBtn.titleLabel?.font.withSize(fontSize)
            make.left.top.trailing.bottom.equalToSuperview()
        }
    
        /* */
        /* 키워드 리스트 */
        keywordListTV.snp.makeConstraints { (make) in
            make.top.equalTo(keywordSelectWrap.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        /* */
    }
}
