//
//  AroundStoreVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa

//내 주변 가게
class AroundStoreVC:BaseViewController,View {
    
    let aroundStoreView = AroundStoreView()
    let aroundStoreRT = AroundStoreRT()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = aroundStoreView
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        newLayer.frame = view.frame
        aroundStoreView.youtubeListWrap.layer.addSublayer(newLayer)
        reactor = aroundStoreRT
    }
    
    func bind(reactor: AroundStoreRT) {
        /* UIEvent */
    
        /* */
        
        /* UIState */
        let isLocationDenined = aroundStoreView.locationDenined.filter{$0}
        let isCurrentLocation = aroundStoreView.currentLocation.filter{$0 != nil} //현재 좌표 Observe
        let isStoreEvent = aroundStoreView.storeEvent.filter{$0}
        
        isLocationDenined
            .bind{[weak self] result in
                if result {
                    self?.locationAccessDeniedAlert()
                }
            }.disposed(by: disposeBag)
        
        isCurrentLocation
            .bind{ result in
                let params = [
                    "x": result!.x,
                    "y": result!.y
                ]
                reactor.action.onNext(.kakaoLocation(params))
            }.disposed(by: disposeBag)
        
        isStoreEvent
            .bind{[weak self] _ in
                let storeDetailVC = StoreDetailVC()
                self?.navigationController?.pushViewController(storeDetailVC, animated: true)
            }.disposed(by: disposeBag)
        
        /* */
        
        /* reactor Action*/
        reactor.action.onNext(.aroundStore(["query":"서울 강남구 맛집"]))
        /* */
        
        /* reactor State */
        let isKakaoLocationInfo = reactor.state.map{$0.isKakaoLocation}.filter{$0 != nil}.map{$0?.documents}.map{$0 ?? []}.filter{$0.count > 0}
        let isAroundStoreList = reactor.state.map{$0.isAroundStoreList}.filter{$0 != nil}.map{$0?.dataList ?? []}
        
        isKakaoLocationInfo.bind{[weak self] result in
            let region2DepthName:String = result[0].address?.region2depthName ?? ""
            let region3DepthName:String = result[0].address?.region3depthName ?? ""
            self?.aroundStoreView.titleGL.text = region2DepthName + " " + region3DepthName + " 맛집\n여긴 어때요 😋"
            self?.aroundStoreView.blogReviewGL.text = region2DepthName + " " + region3DepthName + " 맛집의 리뷰들을\n모아서 한 번에 확인해 보세요"

        }.disposed(by: disposeBag)
        
        isAroundStoreList.bind{[weak self] result in
            self?.aroundStoreView.storeList = result
//            print(result)
        }.disposed(by: disposeBag)
        /* */
    }
    
    //지역 호출 거절 시 이벤트 method
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
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
//            if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
//                self?.present(aroundStoreVC, animated: true, completion: nil)
//            }
        }
    }
}
