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

class AroundStoreView: BaseView {
    
    lazy var titleGL: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "서울 맛집\n여긴 어때요 😋"
        label.textColor = colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.setLinespace(spacing: 10)
        return label
    }()
    
    lazy var storeSearchWrap: UIView = {
        let view = UIView()
        return view
    }()

    lazy var storeSearchBtn: UIView = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "store_search_btn"), for: .normal)
        button.addTarget(self, action: #selector(didTappedFullSizeBtn), for: .touchUpInside)
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
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    //맛집 더보기 감싸는 뷰
    lazy var storeMoreWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(check(_:))))
        return view
    }()
    
    //맛집 더보기 문구
    lazy var storeMoreTitleGL:UILabel = {
        let label = UILabel()
        label.text = "맛집 더보기 >"
        label.textAlignment = .right
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var storeBorderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()

    lazy var youtubeListWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var blogReviewGL:UILabel = {
        let label = UILabel()
        label.text = "서울 맛집의 리뷰들을\n모아서 한 번에 확인해 보세요"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.numberOfLines = 2
        label.setLinespace(spacing: 8)
        return label
    }()
    
    lazy var youtubeListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    //유튜브 더보기 감싸는 뷰
    lazy var youtubeMoreWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(check(_:))))
        return view
    }()
    
    //리뷰 더보기 문구
    lazy var youtubeMoreTitleGL:UILabel = {
        let label = UILabel()
        label.text = "더보기 >"
        label.textAlignment = .right
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
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
    
    //네이버 더보기 감싸는 뷰
    lazy var naverMoreWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(check(_:))))
        return view
    }()
    
    //리뷰 더보기 문구
    lazy var naverMoreTitleGL:UILabel = {
        let label = UILabel()
        label.text = "더보기 >"
        label.textAlignment = .right
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var naverListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    //티스토리 더보기 감싸는 뷰
    lazy var tistoryMoreWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(check(_:))))
        return view
    }()
    
    //리뷰 더보기 문구
    lazy var tistoryMoreTitleGL:UILabel = {
        let label = UILabel()
        label.text = "더보기 >"
        label.textAlignment = .right
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var tistoryListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    //핀플리 더보기 감싸는 뷰
    lazy var pinpliMoreWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(check(_:))))
        return view
    }()
    
    //리뷰 더보기 문구
    lazy var pinpliMoreTitleGL:UILabel = {
        let label = UILabel()
        label.text = "더보기 >"
        label.textAlignment = .right
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var pinpliListCV: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    var dummyList:[String] = ["1","2","3","4","1","2","3","4","1","2","3","4"]
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
        scrollView.addSubview(storeListWrap)
        storeListWrap.addSubview(storeListCV)
        storeListWrap.addSubview(storeMoreWrap)
        storeMoreWrap.addSubview(storeMoreTitleGL)
        scrollView.addSubview(storeBorderBottom)
        /* */
        /* 유튜브 리스트 */
        scrollView.addSubview(youtubeListWrap)
        youtubeListWrap.addSubview(blogReviewGL)
        youtubeListWrap.addSubview(youtubeMoreWrap)
        youtubeMoreWrap.addSubview(youtubeMoreTitleGL)
        youtubeListWrap.addSubview(youtubeTitleWrap)
        youtubeTitleWrap.addSubview(youtubeTitleLogoImage)
        youtubeTitleWrap.addSubview(youtubeTitleGL)
        youtubeListWrap.addSubview(youtubeListCV)
        /* */
        /* 네이버 리스트 */
        scrollView.addSubview(naverListWrap)
        naverListWrap.addSubview(naverMoreWrap)
        naverMoreWrap.addSubview(naverMoreTitleGL)
        naverListWrap.addSubview(naverTitleWrap)
        naverTitleWrap.addSubview(naverTitleLogoImage)
        naverTitleWrap.addSubview(naverTitleGL)
        naverListWrap.addSubview(naverListCV)
        /* */
        /* 티스토리 리스트 */
        scrollView.addSubview(tistoryListWrap)
        tistoryListWrap.addSubview(tistoryMoreWrap)
        tistoryMoreWrap.addSubview(tistoryMoreTitleGL)
        tistoryListWrap.addSubview(tistoryTitleWrap)
        tistoryTitleWrap.addSubview(tistoryTitleLogoImage)
        tistoryTitleWrap.addSubview(tistoryTitleGL)
        tistoryListWrap.addSubview(tistoryListCV)
        /* */
        /* 핀플리 리스트*/
        scrollView.addSubview(pinpliListWrap)
        pinpliListWrap.addSubview(pinpliMoreWrap)
        pinpliMoreWrap.addSubview(pinpliMoreTitleGL)
        pinpliListWrap.addSubview(pinpliTitleWrap)
        pinpliTitleWrap.addSubview(pinpliTitleLogoImage)
        pinpliTitleWrap.addSubview(pinpliTitleGL)
        pinpliListWrap.addSubview(pinpliListCV)
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
        
        storeListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 283)
            make.leading.equalTo(0)
            make.top.equalTo(scrollView)
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
        
        storeMoreWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 152)
            make.top.equalTo(storeListCV.snp.bottom).offset(6)
            make.trailing.bottom.equalTo(0)
            make.width.equalTo(width)
        }
        
        storeMoreTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            storeMoreTitleGL.font = storeMoreTitleGL.font.withSize(fontSize)
            make.top.equalTo(12)
            make.bottom.equalTo(-16)
            make.leading.equalTo(0)
            make.trailing.equalTo(-22)
        }

        storeBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(storeListWrap.snp.bottom)
            make.width.equalTo(snp.width)
            make.height.equalTo(1)
        }
        /* */
        /* 유튜브 리스트 */
        youtubeListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 356)
            make.leading.equalTo(0)
            make.top.equalTo(storeBorderBottom.snp.bottom)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        blogReviewGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            let height = aspectRatio(standardSize: 56)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
        }
        
        youtubeTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(blogReviewGL.snp.bottom).offset(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(youtubeMoreWrap.snp.leading).offset(-22)
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
        
        youtubeMoreWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.trailing.equalTo(0)
            make.top.equalTo(blogReviewGL.snp.bottom).offset(topRatio)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        youtubeMoreTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            youtubeMoreTitleGL.font = youtubeMoreTitleGL.font.withSize(fontSize)
            make.centerX.centerY.equalTo(youtubeMoreWrap)
        }
        
        youtubeListCV.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.top.equalTo(youtubeMoreWrap.snp.bottom).offset(4)
            make.bottom.equalTo(-bottomRatio)
            make.leading.trailing.equalTo(0)
        }
        /* */
        /* 네이버 리스트 */
        naverListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            make.top.equalTo(youtubeListWrap.snp.bottom).offset(10)
            make.leading.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        naverTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(naverMoreWrap.snp.leading).offset(-22)
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

        naverMoreWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.trailing.equalTo(0)
            make.top.equalTo(topRatio)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }

        naverMoreTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            naverMoreTitleGL.font = naverMoreTitleGL.font.withSize(fontSize)
            make.centerX.centerY.equalTo(naverMoreWrap)
        }
        
        naverListCV.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.top.equalTo(naverMoreWrap.snp.bottom).offset(4)
            make.bottom.equalTo(-bottomRatio)
            make.leading.trailing.equalTo(0)
        }
        /* */
        /* 티스토리 리스트 */
        tistoryListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            make.top.equalTo(youtubeListWrap.snp.bottom).offset(10)
            make.leading.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        tistoryTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(tistoryMoreWrap.snp.leading).offset(-22)
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

        tistoryMoreWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.trailing.equalTo(0)
            make.top.equalTo(topRatio)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }

        tistoryMoreTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            tistoryMoreTitleGL.font = tistoryMoreTitleGL.font.withSize(fontSize)
            make.centerX.centerY.equalTo(tistoryMoreWrap)
        }
        
        tistoryListCV.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.top.equalTo(tistoryMoreWrap.snp.bottom).offset(4)
            make.bottom.equalTo(-bottomRatio)
            make.leading.trailing.equalTo(0)
        }
        /* */
        /* 핀플리 리스트 */
        pinpliListWrap.snp.makeConstraints{ make in
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 310)
            
            make.top.equalTo(tistoryListWrap.snp.bottom).offset(10)
            make.bottom.equalTo(scrollView)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        pinpliTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(pinpliMoreWrap.snp.leading).offset(-22)
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

        pinpliMoreWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 97)
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            make.trailing.equalTo(0)
            make.top.equalTo(topRatio)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }

        pinpliMoreTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            pinpliMoreTitleGL.font = pinpliMoreTitleGL.font.withSize(fontSize)
            make.centerX.centerY.equalTo(pinpliMoreWrap)
        }
        
        pinpliListCV.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.top.equalTo(pinpliMoreWrap.snp.bottom).offset(4)
            make.bottom.equalTo(-bottomRatio)
            make.leading.trailing.equalTo(0)
        }
        /* */
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
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            
        }
    }
    
    @objc private func check(_ gesture: UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            
        }
    }
}

extension AroundStoreView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
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
            cell?.dataSetting(data: storeList[indexPath.row])
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
            storeEvent.accept(true)
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
