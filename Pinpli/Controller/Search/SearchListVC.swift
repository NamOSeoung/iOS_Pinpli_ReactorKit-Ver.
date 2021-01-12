//
//  SearchListVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa
import RxSwift

//키워드 검색 누른 후
class SearchListVC:BaseViewController,View {

    let searchListView = SearchListView()
    
    let placeListRT = PlaceListRT()
    
    var keyword:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchListView
        searchListView.keywordGL.text = keyword + " " + "맛집"
        UIInit()
        reactor = placeListRT
    }
    
    func bind(reactor: PlaceListRT) {
        /* UIEvent */
        searchListView.backBtnWrap.rx.tapGesture()
            .when(.recognized)
            .bind{[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }.disposed(by: disposeBag)
        
        /* */
        
        /* Rx Event */
       
        /* */
        
        /* UIState */
//        let isAreaFirstCode = searchView.areaFirstCode.filter{$0.count > 0}
//        let isAreaSecondCode = searchView.areaSecondCode.filter{$0.count > 0}
        
//        isAreaFirstCode
//            .distinctUntilChanged() //코드값 바뀔때만 호출
//            .bind{ result in
//            let params = [
//                "area" : result
//            ]
//            reactor.action.onNext(.secondArea(params))
//        }.disposed(by: disposeBag)
//        
//        isAreaSecondCode.bind{ result in
////            print("중분류 코드")
////            print(result)
//        }.disposed(by: disposeBag)
        /* */
        
        /* Reactor Action */
//        keyword = keyword.replacingOccurrences(of: "전체", with: "")
        reactor.action.onNext(.placeList(["q":keyword + " 맛집"]))
//        reactor.action.onNext(.placeList(["q":"동작 맛집"]))
        /* */
        
        /* Reactor State */
        let isPlaceList = reactor.state.map{$0.isPlaceList}.filter{$0 != nil}.map{$0 ?? []}
    
        let isErrors = reactor.state.map{$0.isErrors}.filter{$0 != nil}.map{$0 ?? false}
        
        isErrors.bind{result in
            if result {
                print("에러터짐")
            }
        }.disposed(by: disposeBag)
        
        isPlaceList.bind{ [weak self] result in
            self?.searchListView.placeList = result
        }.disposed(by: disposeBag)
        
//        isFirstAreaList.bind{ [weak self] result in
//            self?.searchView.areaFirstList = result
//            if result.count > 0 {
//                reactor.action.onNext(.secondArea(["area":result[0].area]))
//            }
//
//        }.disposed(by: disposeBag)
//
//        isSecondAreaList.bind{ [weak self] result in
//            self?.searchView.areaSecondList = result
//        }.disposed(by: disposeBag)
//
//        isAreaSearchList.bind{ [weak self] result in
//            self?.searchView.areaSearchDataList = result
//        }.disposed(by: disposeBag)
//
        /* */
    }
    
    func UIInit() {
        searchListView.searchListTV.backgroundColor = .white
        searchListView.searchListTV.separatorStyle = .none
//        searchView.areaRightTV.backgroundColor = .white
//        searchView.areaRightTV.separatorStyle = .none
//        searchView.areaSearchTV.backgroundColor = .white
//        searchView.areaSearchTV.separatorStyle = .none
    }
}
