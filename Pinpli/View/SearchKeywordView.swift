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
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
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
    lazy var keywordWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keywordTFClickEvent(_:))))
        return view
    }()
    lazy var keywordGL:UILabel = {
        let label = UILabel()
        label.text = "곱창, 신촌 + 곱창”으로 검색이 가능해요!"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    lazy var keywordTF:UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        textField.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textField.isHidden = true
        textField.textAlignment = .center
        return textField
    }()
    lazy var keywordDelWrap:UIView = {
        let view = UIView()
        view.isHidden = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keywordDeleteEvent(_:))))
        return view
    }()
    lazy var keywordDelImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_keyword")
        return image
    }()
    
    lazy var keywordSelectWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var hotKeywordWrap:UIView = {
        let view = UIView()
        view.tag = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keywordSelectClickEvent(_:))))
        return view
    }()
    lazy var hotKeywordGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.text = "요즘 핫한 키워드는?"
        label.textAlignment = .center
        return label
    }()
    lazy var searchKeywordWrap:UIView = {
        let view = UIView()
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keywordSelectClickEvent(_:))))
        return view
    }()
    lazy var searchKeywordGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.text = "최근 검색한 키워드"
        label.textAlignment = .center
        return label
    }()
    lazy var keywordSelectBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 51, g: 51, b: 51, alpha: 1)
        return view
    }()
    
    lazy var keywordListTV:UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.dataSource = self
        table.delegate = self
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(AreaSecondCell.self,
                       forCellReuseIdentifier: "AreaSecondCell")
        return table
    }()
    
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var disposeBag = DisposeBag()
    weak var keywordSelectHeight:NSLayoutConstraint!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
        
        let isKeywordTFEvent = keywordTF.rx.text.orEmpty.asDriver()
        
        keywordTF.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.keywordGL.isHidden = false
                self?.keywordTF.isHidden = true
                self?.keywordSelectHeight.constant = self?.aspectRatio(standardSize: 52) ?? 0
                self?.keywordSelectBottom.isHidden = false
            })
            .disposed(by: disposeBag)
       
        isKeywordTFEvent.drive(onNext:{ [weak self] result in
            if result.count > 0 {
                self?.keywordDelWrap.isHidden = false
            }else {
                self?.keywordDelWrap.isHidden = true
            }
        }).disposed(by: disposeBag)
    }
    
    private func addContentView(){
        addSubview(headerWrap)
        headerWrap.addSubview(headerBottom)
        headerWrap.addSubview(closeWrap)
        headerWrap.addSubview(keywordWrap)
        keywordWrap.addSubview(keywordGL)
        keywordWrap.addSubview(keywordTF)
        headerWrap.addSubview(keywordDelWrap)
        keywordDelWrap.addSubview(keywordDelImage)
        closeWrap.addSubview(closeGL)
        addSubview(keywordSelectWrap)
        keywordSelectWrap.addSubview(hotKeywordWrap)
        hotKeywordWrap.addSubview(keywordSelectBottom)
        hotKeywordWrap.addSubview(hotKeywordGL)
        keywordSelectWrap.addSubview(searchKeywordWrap)
        searchKeywordWrap.addSubview(searchKeywordGL)
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
        keywordWrap.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(closeWrap.snp.trailing)
            make.trailing.equalTo(keywordDelWrap.snp.leading)
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
        hotKeywordGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            hotKeywordGL.font = hotKeywordGL.font.withSize(fontSize)
            make.left.top.trailing.bottom.equalToSuperview()
        }
        searchKeywordWrap.snp.makeConstraints { (make) in
            make.leading.equalTo(hotKeywordWrap.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(hotKeywordWrap)
        }
        searchKeywordGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            searchKeywordGL.font = searchKeywordGL.font.withSize(fontSize)
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
    
    @objc func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
    @objc func keywordDeleteEvent(_ gesture:UITapGestureRecognizer) {
        keywordTF.text = ""
    }
    @objc func keywordSelectClickEvent(_ gesture: UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            if tag == 0 { // 요즘 핫한 키워드는?
                hotKeywordGL.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
                searchKeywordGL.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
                UIView.animate(withDuration: 0.25, animations: { [weak self] in
                    self?.keywordSelectBottom.frame.origin.x = 0
                })
            }else { //최근 검색한 키워드
                hotKeywordGL.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
                searchKeywordGL.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
                UIView.animate(withDuration: 0.25, animations: { [weak self] in
                    self?.keywordSelectBottom.frame.origin.x = ((self?.currentViewSize.width ?? 375)/2)
                })
            }
        }
    }
    @objc func keywordTFClickEvent(_ gesture:UITapGestureRecognizer) {
        if !keywordGL.isHidden {
            keywordGL.isHidden = true
            keywordTF.isHidden = false
            keywordTF.becomeFirstResponder()
            keywordSelectHeight.constant = 0
            keywordSelectBottom.isHidden = true
        }
    }
}


extension SearchKeywordView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let areaSecondCell: AreaSecondCell = tableView.dequeueReusableCell(withIdentifier: "AreaSecondCell") as! AreaSecondCell
        
        areaSecondCell.areaNameGL.text = "서울 동작구"
        
        return areaSecondCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
