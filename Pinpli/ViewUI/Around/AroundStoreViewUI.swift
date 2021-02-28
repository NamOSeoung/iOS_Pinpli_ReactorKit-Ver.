//
//  AroundScrollView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import Foundation
import UIKit
import SnapKit
import MapKit
import CoreLocation
import RxCocoa

class AroundStoreViewUI: BaseView {
    
    lazy var titleGL: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "서울 맛집\n여긴 어때요 😋"
        label.textColor = colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.setLinespace(spacing: 10)
        return label
    }()
    
    lazy var storeHeaderWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var storeHeaderGL:UILabel = {
        let label = UILabel()
        label.text = "서울 맛집 여기는 어때요?"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 2
        label.setLinespace(spacing: 8)
        return label
    }()
    
    lazy var storeSearchWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var storeSearchBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "store_search_btn"), for: .normal)
        return button
    }()
    
    lazy var storeSearchBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = colorSetting(r: 242, g: 242, b: 242, alpha: 1)
        return scrollView
    }()
    
    lazy var reviewListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    
    lazy var storeListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var storeListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 23 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .white
        collectionView.register(AroundStoreCell.self, forCellWithReuseIdentifier: "AroundStoreCell")
        return collectionView
    }()
    
    lazy var storeMoreBtn:UIButton = {
        let button = UIButton()
        button.setTitle("맛집 더보기 >", for: .normal)
        button.contentHorizontalAlignment = .right //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()
    
    lazy var storeBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var reviewHeaderWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var reviewHeaderGL:UILabel = {
        let label = UILabel()
        label.text = "서울 맛집의 리뷰들을\n모아서 한 번에 확인해 보세요"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 2
        label.setLinespace(spacing: 8)
        return label
    }()
    
    lazy var youtubeListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var youtubeListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 22 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .clear
        collectionView.register(AroundYoutubeCell.self, forCellWithReuseIdentifier: "AroundYoutubeCell")
        return collectionView
    }()
    
    lazy var youtubeMoreBtn:UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.contentHorizontalAlignment = .right //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()

    lazy var youtubeTitleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var youtubeTitleLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "youtube_logo")
        return image
    }()
    
    lazy var youtubeTitleGL:UILabel = {
        let label = UILabel()
        label.text = "유튜브 리뷰"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    lazy var youtubeIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰는 아직 없어요 :("
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var naverListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var naverTitleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var naverTitleLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "naver_logo")
        return image
    }()
    
    lazy var naverTitleGL:UILabel = {
        let label = UILabel()
        label.text = "네이버 리뷰"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    lazy var naverIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰는 아직 없어요 :("
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var naverMoreBtn:UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.contentHorizontalAlignment = .right //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()
    
    lazy var naverListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 22 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .clear
        collectionView.register(AroundNaverCell.self, forCellWithReuseIdentifier: "AroundNaverCell")
        return collectionView
    }()
    
    lazy var tistoryListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tistoryTitleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tistoryTitleLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tistory_logo")
        return image
    }()
    
    lazy var tistoryTitleGL:UILabel = {
        let label = UILabel()
        label.text = "티스토리 리뷰"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    lazy var tistoryIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰는 아직 없어요 :("
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var tistoryMoreBtn:UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.contentHorizontalAlignment = .right //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()

    lazy var tistoryListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 22 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .clear
        collectionView.register(AroundTistoryCell.self, forCellWithReuseIdentifier: "AroundTistoryCell")
        return collectionView
    }()
    
    lazy var pinpliListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pinpliTitleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var pinpliTitleLogoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pinpli_logo")
        return image
    }()
    
    lazy var pinpliTitleGL:UILabel = {
        let label = UILabel()
        label.text = "핀플리 리뷰"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        return label
    }()
    
    lazy var pinpliIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰는 아직 없어요 :("
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var pinpliMoreBtn:UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.contentHorizontalAlignment = .right //버튼 좌우 정렬
        button.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return button
    }()
    
    lazy var pinpliListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 22 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .clear
        collectionView.register(AroundPinpliCell.self, forCellWithReuseIdentifier: "AroundPinpliCell")
        return collectionView
    }()
    
    let locationManager = CLLocationManager()
    var locationDenined:BehaviorRelay<Bool> = BehaviorRelay.init(value: false) //현재 위치 권한체크
    var currentLocation:BehaviorRelay<(x:Double, y:Double)?> = BehaviorRelay.init(value: nil) //현재 좌표
    var storeEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)//상점 클릭 이벤트
    var reviewMoreEvent:BehaviorRelay<Int?> = BehaviorRelay.init(value: nil) //리뷰 더보기 이벤트
    
    var dummyList:[String] = ["1","2","3","4","1","2","3","4","1","2","3","4"]
    weak var storeHeaderHeight:NSLayoutConstraint!
    weak var reviewHeaderHeight:NSLayoutConstraint!
    weak var youtubeReviewWrapHeight:NSLayoutConstraint!
    weak var naverReviewWrapHeight:NSLayoutConstraint!
    weak var tistoryReviewWrapHeight:NSLayoutConstraint!
    weak var pinpliReviewWrapHeight:NSLayoutConstraint!
    
    var storeList:[AroundStoreRPModelData] = [] {
        didSet {
            storeListCV.reloadData()
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        requestGPSPermission()
        /* Title ex) 구로구 구로동 맛집 \n 여긴 어때요*/
        addSubview(titleGL)
        /* */
        /* 가게 검색 */
        addSubview(storeSearchWrap)
        storeSearchWrap.addSubview(storeSearchBtn)
        addSubview(storeSearchBorderBottom)
        /* */
        /* 스크롤 뷰 */
        addSubview(scrollView)
        /* */
        /* 가게 리스트 */
        scrollView.addSubview(storeHeaderWrap)
        storeHeaderWrap.addSubview(storeHeaderGL)
        scrollView.addSubview(storeListWrap)
        storeListWrap.addSubview(storeListCV)
        storeListWrap.addSubview(storeMoreBtn)
        scrollView.addSubview(storeBorderBottom)
        /* */
        /* 리뷰 리스트 헤더 */
        scrollView.addSubview(reviewHeaderWrap)
        reviewHeaderWrap.addSubview(reviewHeaderGL)
        /* 유튜브 리스트 */
        scrollView.addSubview(youtubeListWrap)
//        youtubeListWrap.addSubview(blogReviewGL)
        youtubeListWrap.addSubview(youtubeMoreBtn)
        youtubeListWrap.addSubview(youtubeTitleWrap)
        youtubeTitleWrap.addSubview(youtubeTitleLogoImage)
        youtubeTitleWrap.addSubview(youtubeTitleGL)
//        youtubeListWrap.addSubview(youtubeListCV)
        /* */
        /* 네이버 리스트 */
        scrollView.addSubview(naverListWrap)
        naverListWrap.addSubview(naverMoreBtn)
        naverListWrap.addSubview(naverTitleWrap)
        naverTitleWrap.addSubview(naverTitleLogoImage)
        naverTitleWrap.addSubview(naverTitleGL)
//        naverListWrap.addSubview(naverListCV)
        /* */
        /* 티스토리 리스트 */
        scrollView.addSubview(tistoryListWrap)
        tistoryListWrap.addSubview(tistoryMoreBtn)
        tistoryListWrap.addSubview(tistoryTitleWrap)
        tistoryTitleWrap.addSubview(tistoryTitleLogoImage)
        tistoryTitleWrap.addSubview(tistoryTitleGL)
//        tistoryListWrap.addSubview(tistoryListCV)
        /* */
        /* 핀플리 리스트*/
        scrollView.addSubview(pinpliListWrap)
        pinpliListWrap.addSubview(pinpliMoreBtn)
        pinpliListWrap.addSubview(pinpliTitleWrap)
        pinpliTitleWrap.addSubview(pinpliTitleLogoImage)
        pinpliTitleWrap.addSubview(pinpliTitleGL)
//        pinpliListWrap.addSubview(pinpliListCV)
        /* */
        
        
        
        
        /* Title ex) 구로구 구로동 맛집 \n 여긴 어때요*/
        titleGL.snp.makeConstraints{ (make) in
            make.leading.trailing.equalTo(24)
            make.height.equalTo(84)
            make.top.equalTo(safeAreaLayoutGuide).offset(19)
        }
        /* */
        
        /* 가게 검색 */
        storeSearchWrap.snp.makeConstraints{ (make) in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 50)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.equalTo(titleGL.snp.bottom).offset(6)
        }
        
        storeSearchBtn.snp.makeConstraints{ (make) in
            make.width.height.equalTo(storeSearchWrap)
        }
        
        storeSearchBorderBottom.snp.makeConstraints{ (make) in
            make.width.equalTo(snp.width)
            make.height.equalTo(1)
            make.top.equalTo(storeSearchWrap.snp.bottom).offset(0)
        }
        /* */
        /* 가게 리스트 */
        scrollView.snp.makeConstraints{ (make) in
            let width = currentViewSize.width
            make.leading.equalTo(0)
            make.top.equalTo(storeSearchBorderBottom.snp.bottom)
            make.width.equalTo(width)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        storeHeaderWrap.snp.makeConstraints { (make) in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 48)
            storeHeaderHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.leading.equalTo(0)
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        
        storeHeaderGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 20)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            storeHeaderGL.font = storeHeaderGL.font.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        
        storeListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 283)
            make.leading.equalTo(0)
            make.top.equalTo(storeHeaderWrap.snp.bottom)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        storeListCV.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 25)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 56)
            make.leading.trailing.equalTo(0)
            make.top.equalTo(topRatio)
            make.bottom.equalTo(-(bottomRatio))
        }
        
        storeMoreBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let width = aspectRatio(standardSize: 152)
            make.top.equalTo(storeListCV.snp.bottom).offset(6)
            make.trailing.bottom.equalTo(0)
            make.width.equalTo(width)
            storeMoreBtn.titleLabel?.font = storeMoreBtn.titleLabel?.font.withSize(fontSize)
            storeMoreBtn.titleEdgeInsets.right = 22
        }
 
        storeBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(storeListWrap.snp.bottom)
            make.width.equalTo(snp.width)
            make.height.equalTo(1)
        }
        /* */
        reviewHeaderWrap.snp.makeConstraints { (make) in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 86)
            reviewHeaderHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.top.equalTo(storeBorderBottom.snp.bottom)
            make.leading.equalTo(0)
            make.width.equalTo(width)
        }
        reviewHeaderGL.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            let height = aspectRatio(standardSize: 56)
            let fontSize = aspectRatio(standardSize: 20)
            reviewHeaderGL.font = reviewHeaderGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
        }
        /* 유튜브 리스트 */
        youtubeListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 270)
            make.leading.equalTo(0)
            make.top.equalTo(reviewHeaderWrap.snp.bottom)
            make.width.equalTo(width)
            youtubeReviewWrapHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
        }

        youtubeTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(youtubeMoreBtn.snp.leading).offset(-22)
        }

        youtubeTitleLogoImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            make.centerY.equalTo(youtubeTitleWrap)
            make.leading.equalTo(0)
            make.width.height.equalTo(width)
        }

        youtubeTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.centerY.equalTo(youtubeTitleWrap)
            youtubeTitleGL.font = youtubeTitleGL.font.withSize(fontSize)
            make.leading.equalTo(youtubeTitleLogoImage.snp.trailing).offset(10)
            make.trailing.equalTo(0)
        }

        youtubeMoreBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
            youtubeMoreBtn.titleLabel?.font = storeMoreBtn.titleLabel?.font.withSize(fontSize)
            youtubeMoreBtn.titleEdgeInsets.right = 22
        }

        /* */
        /* 네이버 리스트 */
        naverListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            make.top.equalTo(youtubeListWrap.snp.bottom).offset(10)
            make.leading.equalTo(0)
            make.width.equalTo(width)
            naverReviewWrapHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
        }
        
        naverTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(naverMoreBtn.snp.leading).offset(-22)
        }
        
        naverTitleLogoImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            make.centerY.equalTo(naverTitleWrap)
            make.leading.equalTo(0)
            make.width.height.equalTo(width)
        }
        
        naverTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.centerY.equalTo(naverTitleWrap)
            naverTitleGL.font = naverTitleGL.font.withSize(fontSize)
            make.leading.equalTo(naverTitleLogoImage.snp.trailing).offset(10)
            make.trailing.equalTo(0)
        }
        
        naverMoreBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
            naverMoreBtn.titleLabel?.font = storeMoreBtn.titleLabel?.font.withSize(fontSize)
            naverMoreBtn.titleEdgeInsets.right = 22
        }
        /* */
        /* 티스토리 리스트 */
        tistoryListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            make.top.equalTo(naverListWrap.snp.bottom).offset(10)
            make.leading.equalTo(0)
            make.width.equalTo(width)
            tistoryReviewWrapHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
        }
        
        tistoryTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(tistoryMoreBtn.snp.leading).offset(-22)
        }
        
        tistoryTitleLogoImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            make.centerY.equalTo(tistoryTitleWrap)
            make.leading.equalTo(0)
            make.width.height.equalTo(width)
        }
        
        tistoryTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.centerY.equalTo(tistoryTitleWrap)
            tistoryTitleGL.font = tistoryTitleGL.font.withSize(fontSize)
            make.leading.equalTo(tistoryTitleLogoImage.snp.trailing).offset(10)
            make.trailing.equalTo(0)
        }
        
        tistoryMoreBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
            tistoryMoreBtn.titleLabel?.font = storeMoreBtn.titleLabel?.font.withSize(fontSize)
            tistoryMoreBtn.titleEdgeInsets.right = 22
        }

        /* */
        /* 핀플리 리스트 */
        pinpliListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            
            make.top.equalTo(tistoryListWrap.snp.bottom).offset(10)
            make.bottom.equalTo(scrollView)
            make.width.equalTo(width)
            pinpliReviewWrapHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
        }
        pinpliTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(pinpliMoreBtn.snp.leading).offset(-22)
        }
        
        pinpliTitleLogoImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 21)
            let height = aspectRatio(standardSize: 30)
            make.centerY.equalTo(pinpliTitleWrap)
            make.leading.equalTo(9)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        
        pinpliTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.centerY.equalTo(pinpliTitleWrap)
            pinpliTitleGL.font = pinpliTitleGL.font.withSize(fontSize)
            make.leading.equalTo(pinpliTitleLogoImage.snp.trailing).offset(10)
            make.trailing.equalTo(0)
        }
        
        pinpliMoreBtn.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
            pinpliMoreBtn.titleLabel?.font = storeMoreBtn.titleLabel?.font.withSize(fontSize)
            pinpliMoreBtn.titleEdgeInsets.right = 22
        }
        /* */
        currentLocationSetting(gubun: true)
        youtubeIsEmptySetting(gubun: false)
        naverIsEmptySetting(gubun: true)
        tistoryIsEmptySetting(gubun: false)
        pinpliIsEmptySetting(gubun: true)
    }
    
    func currentLocationSetting(gubun:Bool) { //현위치 정보 제공, 미제공 시 storeHeader 세팅
        if gubun {
            storeHeaderHeight?.constant = 0
            storeHeaderWrap.isHidden = true
        }else {
            let height = aspectRatio(standardSize: 48)
            storeHeaderHeight?.constant = height
            storeHeaderWrap.isHidden = false
        }
    }
    
    func youtubeIsEmptySetting(gubun:Bool) {
        for view in subviews {
            if view == youtubeListWrap {
                for child in view.subviews {
                    if child == youtubeListCV {
                        child.removeFromSuperview()
                    }
                }
            }
        }
        
        if gubun {
            let reviewWrapHeight = aspectRatio(standardSize: 126)
            
            youtubeReviewWrapHeight?.constant = reviewWrapHeight
            reviewHeaderHeight?.constant = 0
            youtubeMoreBtn.isHidden = true
//            reviewHeaderWrap.isHidden = true
            youtubeListWrap.addSubview(youtubeIsEmptyGL)
            youtubeIsEmptyGL.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 16)
                let topRatio = constraintRatio(direction: .top, standardSize: 15)
                make.leading.equalTo(22)
                make.trailing.equalTo(-22)
                make.top.equalTo(youtubeTitleLogoImage.snp.bottom).offset(topRatio)
                youtubeIsEmptyGL.font = youtubeIsEmptyGL.font.withSize(fontSize)
            }

        }else {
            let reviewWrapHeight = aspectRatio(standardSize: 270)
//            let headerWrapHeight = aspectRatio(standardSize: 86)
            youtubeReviewWrapHeight?.constant = reviewWrapHeight
//            reviewHeaderHeight?.constant = headerWrapHeight
            youtubeMoreBtn.isHidden = false
            youtubeListWrap.addSubview(youtubeListCV)

            youtubeListCV.snp.makeConstraints{ make in
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                make.top.equalTo(youtubeMoreBtn.snp.bottom).offset(4)
                make.bottom.equalTo(-bottomRatio)
                make.leading.trailing.equalTo(0)
            }
        }
    }
    
    func naverIsEmptySetting(gubun:Bool) {
        for view in subviews {
            if view == naverListWrap {
                for child in view.subviews {
                    if child == naverListCV {
                        child.removeFromSuperview()
                    }
                }
            }
        }
        
        if gubun {
            let reviewWrapHeight = aspectRatio(standardSize: 126)
            
            naverReviewWrapHeight?.constant = reviewWrapHeight
            naverMoreBtn.isHidden = true
            naverListWrap.addSubview(naverIsEmptyGL)
            naverIsEmptyGL.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 16)
                let topRatio = constraintRatio(direction: .top, standardSize: 15)
                make.leading.equalTo(22)
                make.trailing.equalTo(-22)
                make.top.equalTo(naverTitleLogoImage.snp.bottom).offset(topRatio)
                naverIsEmptyGL.font = naverIsEmptyGL.font.withSize(fontSize)
            }

        }else {
            let reviewWrapHeight = aspectRatio(standardSize: 310)
            naverReviewWrapHeight?.constant = reviewWrapHeight
            naverMoreBtn.isHidden = false
            naverListWrap.addSubview(naverListCV)

            naverListCV.snp.makeConstraints{ make in
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                make.top.equalTo(naverMoreBtn.snp.bottom).offset(4)
                make.bottom.equalTo(-bottomRatio)
                make.leading.trailing.equalTo(0)
            }
        }
    }
    
    func tistoryIsEmptySetting(gubun:Bool) {
        for view in subviews {
            if view == tistoryListWrap {
                for child in view.subviews {
                    if child == tistoryListCV {
                        child.removeFromSuperview()
                    }
                }
            }
        }
        
        if gubun {
            let reviewWrapHeight = aspectRatio(standardSize: 126)
            
            tistoryReviewWrapHeight?.constant = reviewWrapHeight
            tistoryMoreBtn.isHidden = true
            tistoryListWrap.addSubview(tistoryIsEmptyGL)
            tistoryIsEmptyGL.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 16)
                let topRatio = constraintRatio(direction: .top, standardSize: 15)
                make.leading.equalTo(22)
                make.trailing.equalTo(-22)
                make.top.equalTo(tistoryTitleLogoImage.snp.bottom).offset(topRatio)
                tistoryIsEmptyGL.font = tistoryIsEmptyGL.font.withSize(fontSize)
            }

        }else {
            let reviewWrapHeight = aspectRatio(standardSize: 310)
            tistoryReviewWrapHeight?.constant = reviewWrapHeight
            tistoryMoreBtn.isHidden = false
            tistoryListWrap.addSubview(tistoryListCV)

            tistoryListCV.snp.makeConstraints{ make in
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                make.top.equalTo(tistoryMoreBtn.snp.bottom).offset(4)
                make.bottom.equalTo(-bottomRatio)
                make.leading.trailing.equalTo(0)
            }
        }
    }
    
    func pinpliIsEmptySetting(gubun:Bool) {
        for view in subviews {
            if view == pinpliListWrap {
                for child in view.subviews {
                    if child == pinpliListCV {
                        child.removeFromSuperview()
                    }
                }
            }
        }
        
        if gubun {
            let reviewWrapHeight = aspectRatio(standardSize: 126)
            
            pinpliReviewWrapHeight?.constant = reviewWrapHeight
            pinpliMoreBtn.isHidden = true
            pinpliListWrap.addSubview(pinpliIsEmptyGL)
            pinpliIsEmptyGL.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 16)
                let topRatio = constraintRatio(direction: .top, standardSize: 15)
                make.leading.equalTo(22)
                make.trailing.equalTo(-22)
                make.top.equalTo(pinpliTitleLogoImage.snp.bottom).offset(topRatio)
                pinpliIsEmptyGL.font = pinpliIsEmptyGL.font.withSize(fontSize)
            }

        }else {
            let reviewWrapHeight = aspectRatio(standardSize: 310)
            pinpliReviewWrapHeight?.constant = reviewWrapHeight
            pinpliMoreBtn.isHidden = false
            pinpliListWrap.addSubview(pinpliListCV)

            pinpliListCV.snp.makeConstraints{ make in
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                make.top.equalTo(pinpliMoreBtn.snp.bottom).offset(4)
                make.bottom.equalTo(-bottomRatio)
                make.leading.trailing.equalTo(0)
            }
        }
    }
    
    
    
    //gps 퍼미션 체크
    func requestGPSPermission(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            print(location)
            currentLocation.accept(location)
        case .restricted, .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            print(location)
            currentLocation.accept(location)
            break
        case .denied:
            locationDenined.accept(true)
            break
        default:
            break
        }
    }
}
