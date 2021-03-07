//
//  AroundStoreVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit
//import ReactorKit
import RxCocoa
import MapKit
import CoreLocation

//내 주변 가게
class AroundStoreVC:BaseViewController, CLLocationManagerDelegate {
    
    let aroundStoreViewUI = AroundStoreViewUI()
    var titleGL:UILabel? //타이틀
    var reviewHeaderGL:UILabel? //리뷰 타이틀
    var storeSearchBtn:UIButton? //가고싶은 가게 이름 검색 버튼
    var storeMoreBtn:UIButton? //맛집 리뷰 더보기 버튼
    var youtubeMoreBtn:UIButton? //유튜브 리뷰 더보기 버튼
    var naverMoreBtn:UIButton? //네이버 리뷰 더보기 버튼
    var tistoryMoreBtn:UIButton? //티스토리 리뷰 더보기 버튼
    var pinpliMoreBtn:UIButton? //핀플리 리뷰 더보기 버튼
    var storeListCV:UICollectionView?
    var youtubeListCV:UICollectionView?
    var naverListCV:UICollectionView?
    var tistoryListCV:UICollectionView?
    var pinpliListCV:UICollectionView?
    
    var dummyList:[String] = ["1","2","3","4","1","2","3","4","1","2","3","4"]
    var storeList:[String] = ["2","3","4","2","3","4","2","3","4"]
    
    let locationManager = CLLocationManager()
    var locationDenined:BehaviorRelay<Bool> = BehaviorRelay.init(value: false) //현재 위치 권한체크
    var currentLocation:BehaviorRelay<(x:Double, y:Double)?> = BehaviorRelay.init(value: nil) //현재 좌표
    
    var aroundStoreViewModel: AroundStoreViewModel = AroundStoreViewModel(kakaoLocationAPIService: KakaoLocationAPIService())

    override func viewDidLoad() {
        super.viewDidLoad()
        view = aroundStoreViewUI
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        newLayer.frame = view.frame
        aroundStoreViewUI.youtubeListWrap.layer.addSublayer(newLayer)
        tabBarController?.tabBar.layer.borderWidth = 0.5
        tabBarController?.tabBar.layer.borderColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        requestGPSPermission()
    }
    
    private func bind() {
        /* UIInit */
        titleGL = aroundStoreViewUI.titleGL
        reviewHeaderGL = aroundStoreViewUI.reviewHeaderGL
        storeSearchBtn = aroundStoreViewUI.storeSearchBtn
        storeMoreBtn = aroundStoreViewUI.storeMoreBtn
        youtubeMoreBtn = aroundStoreViewUI.youtubeMoreBtn
        naverMoreBtn = aroundStoreViewUI.naverMoreBtn
        tistoryMoreBtn = aroundStoreViewUI.tistoryMoreBtn
        pinpliMoreBtn = aroundStoreViewUI.pinpliMoreBtn
        storeListCV = aroundStoreViewUI.storeListCV
        youtubeListCV = aroundStoreViewUI.youtubeListCV
        naverListCV = aroundStoreViewUI.naverListCV
        tistoryListCV = aroundStoreViewUI.tistoryListCV
        pinpliListCV = aroundStoreViewUI.pinpliListCV
        
        /* UIDelegate*/
        storeListCV?.delegate = self
        storeListCV?.dataSource = self
        youtubeListCV?.delegate = self
        youtubeListCV?.dataSource = self
        naverListCV?.delegate = self
        naverListCV?.dataSource = self
        tistoryListCV?.delegate = self
        tistoryListCV?.dataSource = self
        pinpliListCV?.delegate = self
        pinpliListCV?.dataSource = self
        locationManager.delegate = self
        
        /* UIAction */
        storeSearchBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.storeSearchBtn?.showAnimation {
                    let searchKeywordVC = SearchKeywordVC()
                    searchKeywordVC.modalPresentationStyle = .fullScreen
                    self?.present(searchKeywordVC, animated: true, completion: nil)
                }
            }).disposed(by: disposeBag)
        
        storeMoreBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.storeMoreBtn?.showAnimation {
                    print("맛집 더보기~")
                }
            }).disposed(by: disposeBag)
        
        youtubeMoreBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.youtubeMoreBtn?.showAnimation {
                    print("유튜브 더보기~")
                }
            }).disposed(by: disposeBag)
        
        naverMoreBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.naverMoreBtn?.showAnimation {
                    print("네이버 더보기~")
                }
            }).disposed(by: disposeBag)
        
        tistoryMoreBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.tistoryMoreBtn?.showAnimation {
                    print("티스토리 더보기~")
                }
            }).disposed(by: disposeBag)
        
        pinpliMoreBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.pinpliMoreBtn?.showAnimation {
                    print("핀플리 더보기~")
                }
            }).disposed(by: disposeBag)
        
        /* UIState */
        let addressName = aroundStoreViewModel.addressName.filter{$0 != nil}
        
        addressName.subscribe(onNext:{ [weak self] result in
            self?.titleGL?.text = result! + "맛집\n여긴 어때요 😋"
            self?.reviewHeaderGL?.text = result! + "의 리뷰들을\n모아서 한 번에 확인해 보세요"
        }).disposed(by: disposeBag)
        
    }
    
    
    //지역 호출 거절 시 이벤트 method
    func locationAccessDeniedAlert() {
        let alert = UIAlertController(title: "내 주변에 있는 맛집을 알아봐요 😝", message: "\n더 정확한 검색을 위해서\n위치 접근 권한을 허용해주세요 :)", preferredStyle: .alert)
        
        // Change font and color of title
        
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17,weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        alert.addAction(UIAlertAction(title: "취소하기", style: .cancel, handler: { (action:UIAlertAction!) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "허용하기", style: .default, handler: { (action:UIAlertAction!) in
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
    
    //gps 퍼미션 체크
    func requestGPSPermission(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            aroundStoreViewModel.currentLocation.accept(location)
            break
        case .restricted, .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            aroundStoreViewModel.currentLocation.accept(location)
            break
        case .denied:
            locationAccessDeniedAlert()
            break
        default:
            break
        }
    }
    
    func locationManager( _ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus ) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let locationValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            aroundStoreViewModel.currentLocation.accept(location)
            break
        case .restricted, .notDetermined:
            guard let locationValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            aroundStoreViewModel.currentLocation.accept(location)
            break
        case .denied:
            locationAccessDeniedAlert()
            break
        default:
            break
        }
    }
}

extension AroundStoreVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storeListCV {
            return storeList.count
        }else {
            return dummyList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storeListCV {
            var cell:AroundStoreCell?
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "AroundStoreCell", for:indexPath) as? AroundStoreCell)
            
            return cell!
        }else if collectionView == youtubeListCV {
            var cell:AroundYoutubeCell?
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "AroundYoutubeCell", for:indexPath) as? AroundYoutubeCell)
            return cell!
        }else if collectionView == naverListCV{
            var cell:AroundNaverCell?
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "AroundNaverCell", for:indexPath) as? AroundNaverCell)
            return cell!
        }else if collectionView == tistoryListCV {
            var cell:AroundTistoryCell?
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "AroundTistoryCell", for:indexPath) as? AroundTistoryCell)
            return cell!
        }else {
            var cell:AroundPinpliCell?
            cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "AroundPinpliCell", for:indexPath) as? AroundPinpliCell)
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == storeListCV {
            //            storeEvent.accept(true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == storeListCV {
            var width = CGFloat(0.0)
            var height = CGFloat(0.0)
            
            
            width = (170/375) * collectionView.frame.width
            height = collectionView.frame.height
            
            let size = CGSize(width: width, height: height)
            
            return size
        }else if collectionView == youtubeListCV{
            var width = CGFloat(0.0)
            var height = CGFloat(0.0)
            
            width = (200/375) * collectionView.frame.width
            height = collectionView.frame.height
            
            let size = CGSize(width: width, height: height)
            
            return size
        }else if collectionView == naverListCV{
            var width = CGFloat(0.0)
            var height = CGFloat(0.0)
            
            width = (160/375) * collectionView.frame.width
            height = collectionView.frame.height
            
            let size = CGSize(width: width, height: height)
            
            return size
        }else if collectionView == tistoryListCV{
            var width = CGFloat(0.0)
            var height = CGFloat(0.0)
            
            width = (160/375) * collectionView.frame.width
            height = collectionView.frame.height
            
            let size = CGSize(width: width, height: height)
            
            return size
        }else {
            var width = CGFloat(0.0)
            var height = CGFloat(0.0)
            
            width = (160/375) * collectionView.frame.width
            height = collectionView.frame.height
            
            let size = CGSize(width: width, height: height)
            
            return size
        }
    }
}
