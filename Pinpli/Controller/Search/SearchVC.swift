//
//  SearchVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa
import RxSwift

//검색
class SearchVC:BaseViewController,View {

    let searchView = SearchView()
    
    let commonAreaRT = CommonAreaRT()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        UIInit()
        reactor = commonAreaRT
    }
    
    func bind(reactor: CommonAreaRT) {
        /* UIEvent */
        
        /* */
        
        /* UIState */
        let isAreaFirstCode = searchView.areaFirstCode.filter{$0.count > 0}
        let isAreaSecondName = searchView.areaSecondName.filter{$0.count > 0}
        let isLocationDenined = searchView.locationDenined.filter{$0}
        let isCurrentLocation = searchView.currentLocation.filter{$0 != nil} //현재 좌표 Observe
        
        isAreaFirstCode
            .distinctUntilChanged() //코드값 바뀔때만 호출
            .bind{ result in
            let params = [
                "area" : result
            ]
            reactor.action.onNext(.secondArea(params))
        }.disposed(by: disposeBag)
        
        isAreaSecondName.bind{ [weak self] result in
            self?.keywordSearchMove(areaName: result)
        }.disposed(by: disposeBag)
        
        isLocationDenined
            .bind{[weak self] result in
                if result {
                    self?.locationAccessDeniedAlert()
                }
            }.disposed(by: disposeBag)
        
        /* */
        
        isCurrentLocation
            .bind{ result in
                let params = [
                    "x": result!.x,
                    "y": result!.y
                ]
                reactor.action.onNext(.kakaoLocation(params))
            }.disposed(by: disposeBag)
        
        /* Reactor Action */
        reactor.action.onNext(.firstArea)
        reactor.action.onNext(.areaSearch)
        /* */
        
        /* Reactor State */
        let isFirstAreaList = reactor.state.map{$0.isFirstArea}.filter{$0 != nil}.map{$0 ?? []}
        let isSecondAreaList = reactor.state.map{$0.isSecondArea}.filter{$0 != nil}.map{$0 ?? []}
        let isAreaSearchList = reactor.state.map{$0.isAreaSearch}.filter{$0 != nil}.map{$0 ?? []}
        let isKakaoLocationInfo = reactor.state.map{$0.isKakaoLocation}.filter{$0 != nil}.map{$0?.documents}.map{$0 ?? []}.filter{$0.count > 0}
        let isErrors = reactor.state.map{$0.isErrors}.filter{$0 != nil}.map{$0 ?? false}
        
        isErrors.bind{result in
            if result {
                print("에러터짐")
            }
        }.disposed(by: disposeBag)
        
        isFirstAreaList.bind{ [weak self] result in
            self?.searchView.areaFirstList = result
            if result.count > 0 {
                reactor.action.onNext(.secondArea(["area":result[0].area]))
            }
    
        }.disposed(by: disposeBag)
        
        isSecondAreaList.bind{ [weak self] result in
            self?.searchView.areaSecondList = result
        }.disposed(by: disposeBag)
        
        isAreaSearchList.bind{ [weak self] result in
            self?.searchView.areaSearchDataList = result
        }.disposed(by: disposeBag)
        
        isKakaoLocationInfo.bind{ [weak self] result in
            let region1DepthName:String = result[0].address?.region1depthName ?? ""
            let region2DepthName:String = result[0].address?.region2depthName ?? ""
            let region3DepthName:String = result[0].address?.region3depthName ?? ""
            
            
            self?.keywordSearchMove(areaName: region1DepthName + " " + region2DepthName + " " + region3DepthName)
        }.disposed(by: disposeBag)
        
        /* */
    }
    
    func keywordSearchMove(areaName:String) {
        let searchListVC = SearchListVC()
        searchListVC.keyword = areaName
        navigationController?.pushViewController(searchListVC, animated: true)
    }
    
    func locationAccessDeniedAlert() {
        let alert = UIAlertController(title: "위치 접근 권한 허용", message: "\n더 정확한 검색을 위해서\n위치 접근 권한을 허용해주세요 :)", preferredStyle: .alert)

        // Change font and color of title
        
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17,weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (action:UIAlertAction!) in
            if let settingUrl = URL(string:UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingUrl)
            } else {
                print("Setting URL invalid")
            }
        }))
        
        subview.backgroundColor = UIColor.white
        
        present(alert, animated: true)
    }
    
    
    func UIInit() {
        searchView.areaLeftTV.backgroundColor = .white
        searchView.areaLeftTV.separatorStyle = .none
        searchView.areaRightTV.backgroundColor = .white
        searchView.areaRightTV.separatorStyle = .none
        searchView.areaSearchTV.backgroundColor = .white
        searchView.areaSearchTV.separatorStyle = .none
    }
}
