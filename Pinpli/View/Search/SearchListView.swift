//
//  SearchListView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture

class SearchListView: BaseView {
    
    lazy var keywordWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var backBtnWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var backBtnImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back_189")
        return image
    }()
    
    lazy var keywordGL: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    
    lazy var keywordBorderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var searchListTV: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(PlaceCell.self,
                                forCellReuseIdentifier: "PlaceCell")
        return table
    }()

    var disposeBag = DisposeBag()
    
    var placeList:[PlaceListModel] = [] {
        didSet {
            searchListTV.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(keywordWrap)
        keywordWrap.addSubview(keywordGL)
        keywordWrap.addSubview(backBtnWrap)
        backBtnWrap.addSubview(backBtnImage)
        addSubview(keywordBorderBottom)
        addSubview(searchListTV)
        
    }
    
    private func autoLayout() {
        
        keywordWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 40)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.width.equalTo(snp.width)
            make.height.equalTo(height)
        }
        
        keywordGL.snp.makeConstraints{ make in
            make.centerY.centerX.equalTo(keywordWrap)
        }
        
        backBtnWrap.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(0)
            make.width.equalTo(currentViewSize.width/2)
        }
        
        backBtnImage.snp.makeConstraints{ make in
            make.leading.equalTo(6)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        keywordBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(keywordWrap.snp.bottom)
            make.width.equalTo(snp.width)
            make.height.equalTo(0.5)
        }
        
        searchListTV.snp.makeConstraints{ make in
            make.top.equalTo(keywordBorderBottom.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
//    //키워드 작성 시 이벤트
//    func areaSearchEvent() {
//        let keywordCnt:Int = searchKeywordTF.text?.count ?? 0
//        let keyword:String = searchKeywordTF.text!
//        if keywordCnt > 0 {
//            tableCtrl.accept(false)
//        }else {
//            tableCtrl.accept(true)
//        }
//        areaSearchList.removeAll()
//
//        for area in areaSearchDataList {
//            if area.contains(keyword) {
//                areaSearchList.append(area)
//            }
//        }
//    }
//
//    @objc func aa(_ gesture:UITapGestureRecognizer) {
////        print(2222)
//        gesture.view?.showAnimation { [weak self] in
////            if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
////                self?.present(aroundStoreVC, animated: true, completion: nil)
////            }
//        }
//    }
//
//    @objc func keywordDeleteEvent(_ gesture:UITapGestureRecognizer) {
//        searchKeywordTF.text = ""
//        areaSearchList.removeAll()
//        tableCtrl.accept(true)
//    }
}

extension SearchListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let placeCell: PlaceCell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlaceCell
        placeCell.placeInfoSetting(place: placeList[indexPath.row])
        
        return placeCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}
