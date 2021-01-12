//
//  StoreDetailView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/05.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//가게 상세페이지
class StoreDetailView: BaseView {
    lazy var contentsScrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    lazy var headerImageWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var headerImageCV:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let size:CGSize = UIScreen.main.bounds.size
        layout.estimatedItemSize = .zero
        layout.sectionInset.left = 0 //첫 번째 cell 들이기
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .white
        collectionView.register(StoreDetailImageCell.self, forCellWithReuseIdentifier: "StoreDetailImageCell")
        return collectionView
    }()
    lazy var headerImagePageCtrl:UIPageControl = {
        let pageCtrl = UIPageControl()
        pageCtrl.currentPage = 0
        pageCtrl.pageIndicatorTintColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
        pageCtrl.numberOfPages = 5
        return pageCtrl
    }()
    lazy var headerImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 37")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var headerGradientWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var titleWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.text = "올리엔올리엔올리엔올리엔올리엔올리엔올리엔올리엔올리엔올리엔올리엔올리엔"
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return label
    }()
    
    lazy var backBtnWrap:UIView = {
        let view = UIView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backEvent(_:))))
        return view
    }()
    
    lazy var backBtnImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back")
        return image
    }()
    
    lazy var reviewWriteWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewWriteEvent(_:))))
        return view
    }()
    lazy var reviewWriteGL:UILabel = {
        let label = UILabel()
        label.text = "리뷰 쓰기"
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return label
    }()
    
    lazy var storeTitleWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var openFlagGL:UILabel = {
        let label = UILabel()
        label.text = "영업중"
        label.colorSetting(r: 111, g: 207, b: 151, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    lazy var ratingGL:UILabel = {
        let label = UILabel()
        label.text = "★  4.1"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    lazy var categoryGL:UILabel = {
        let label = UILabel()
        label.text = "이탈리안 전문점"
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var bookmarkWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var bookmarkImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bookmark_off")
        return image
    }()
    lazy var storeTitleBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var storeInfoWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeAddressWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeTelWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeOpenWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeDescriptionWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeAddressSubjectGL:UILabel = {
        let label = UILabel()
        label.text = "주소"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeTelSubjectGL:UILabel = {
        let label = UILabel()
        label.text = "전화"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeOpenSubjectGL:UILabel = {
        let label = UILabel()
        label.text = "시간"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeDescriptionSubjectGL:UILabel = {
        let label = UILabel()
        label.text = "※"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    lazy var storeAddressGL:UILabel = {
        let label = UILabel()
        label.text = "경기 남양주시 별내5로 5번길 11 108호"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeTelGL:UILabel = {
        let label = UILabel()
        label.text = "031-57-9280"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeOpenGL:UILabel = {
        let label = UILabel()
        label.text = "매일 16:00 ~ 01:00"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    lazy var storeDescriptionGL:UILabel = {
        let label = UILabel()
        label.text = "주차, 포장, 배달 됩니다."
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    
    lazy var storeInfoBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var storeMenuWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var storeMenuTitleGL:UILabel = {
        let label = UILabel()
        label.text = "메뉴"
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    lazy var storeMenuIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "사장님이 메뉴 등록을 깜빡하셨나봐요 😣"
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    lazy var storeMenuBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var pinpliReviewWriteWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewWriteEvent(_:))))
        return view
    }()
    lazy var pinpliReviewWriteGL:UILabel = {
        let label = UILabel()
        label.text = "리뷰 등록하기 >"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        return label
    }()
    
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var reviewWriteEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    weak var headerViewHeightConstraint: NSLayoutConstraint!
    weak var headerGradientViewHeightConstraint:NSLayoutConstraint!
    var viewHeightConstraint: Constraint!
    var statusHeight = UIApplication.shared.statusBarFrame.size.height//Statusbar height
    let scrollTopEdgeInsets:CGFloat = 100//scrollView Top insets size
    var gradientView:UIView?
    lazy var youtubeReviewWrap:UIView = ReviewCommonView().youtubeReviewWrap
    lazy var bottomLineView:UIView = ReviewCommonView().bottomLineView
    lazy var reviewTitleWrap:UIView = ReviewCommonView().reviewTitleWrap
    lazy var reviewTitleGL:UILabel = ReviewCommonView().reviewContentsTitleGL
    lazy var youtubeReviewIsEmptyWrap:UIView = ReviewCommonView().socialReviewIsEmptyWrap
    lazy var youtubeLogo:UIImageView = ReviewCommonView().reviewLogo
    lazy var youtubeTitleGL:UILabel = ReviewCommonView().reviewTitleGL
    lazy var youtubeReviewIsEmptyGL:UILabel = ReviewCommonView().reviewIsEmptyGL
    lazy var youtubeBottomLine:UIView = ReviewCommonView().bottomLineView
    lazy var naverReviewIsEmptyWrap:UIView = ReviewCommonView().socialReviewIsEmptyWrap
    lazy var naverLogo:UIImageView = ReviewCommonView().reviewLogo
    lazy var naverTitleGL:UILabel = ReviewCommonView().reviewTitleGL
    lazy var naverReviewIsEmptyGL:UILabel = ReviewCommonView().reviewIsEmptyGL
    lazy var naverBottomLine:UIView = ReviewCommonView().bottomLineView
    lazy var tistoryReviewIsEmptyWrap:UIView = ReviewCommonView().socialReviewIsEmptyWrap
    lazy var tistoryLogo:UIImageView = ReviewCommonView().reviewLogo
    lazy var tistoryTitleGL:UILabel = ReviewCommonView().reviewTitleGL
    lazy var tistoryReviewIsEmptyGL:UILabel = ReviewCommonView().reviewIsEmptyGL
    lazy var tistoryBottomLine:UIView = ReviewCommonView().bottomLineView
    lazy var pinpliReviewIsEmptyWrap:UIView = ReviewCommonView().socialReviewIsEmptyWrap
    lazy var pinpliLogo:UIImageView = ReviewCommonView().reviewLogo
    lazy var pinpliTitleGL:UILabel = ReviewCommonView().reviewTitleGL
    lazy var pinpliReviewIsEmptyGL:UILabel = ReviewCommonView().reviewIsEmptyGL
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        /* 상점 이미지 섹션 */
        addSubview(headerImageWrap)
        headerImageWrap.addSubview(headerImageCV)
        headerImageWrap.addSubview(headerImagePageCtrl)
        headerImageWrap.addSubview(headerGradientWrap)
        /* */
        addSubview(contentsScrollView)
        headerImageWrap.addSubview(titleWrap)
        titleWrap.addSubview(titleGL)
        headerImageWrap.addSubview(backBtnWrap)
        backBtnWrap.addSubview(backBtnImage)
        headerImageWrap.addSubview(reviewWriteWrap)
        reviewWriteWrap.addSubview(reviewWriteGL)
        contentsScrollView.addSubview(storeTitleWrap)
        storeTitleWrap.addSubview(bookmarkWrap)
        bookmarkWrap.addSubview(bookmarkImage)
        storeTitleWrap.addSubview(openFlagGL)
        storeTitleWrap.addSubview(ratingGL)
        storeTitleWrap.addSubview(categoryGL)
        contentsScrollView.addSubview(storeTitleBottom)
        contentsScrollView.addSubview(storeInfoWrap)
        storeInfoWrap.addSubview(storeAddressWrap)
        storeAddressWrap.addSubview(storeAddressSubjectGL)
        storeInfoWrap.addSubview(storeTelWrap)
        storeInfoWrap.addSubview(storeOpenWrap)
        storeInfoWrap.addSubview(storeDescriptionWrap)
        storeAddressWrap.addSubview(storeAddressSubjectGL)
        storeAddressWrap.addSubview(storeAddressGL)
        storeTelWrap.addSubview(storeTelSubjectGL)
        storeTelWrap.addSubview(storeTelGL)
        storeOpenWrap.addSubview(storeOpenSubjectGL)
        storeOpenWrap.addSubview(storeOpenGL)
        storeDescriptionWrap.addSubview(storeDescriptionSubjectGL)
        storeDescriptionWrap.addSubview(storeDescriptionGL)
        contentsScrollView.addSubview(storeInfoBottom)
        /* 상점 디테일 메뉴 섹션 */
        contentsScrollView.addSubview(storeMenuWrap)
        storeMenuWrap.addSubview(storeMenuTitleGL)
        storeMenuWrap.addSubview(storeMenuIsEmptyGL)
        contentsScrollView.addSubview(storeMenuBottom)
        /* */
        /* 유튜브 리뷰 섹션*/
        contentsScrollView.addSubview(reviewTitleWrap)
        reviewTitleWrap.addSubview(reviewTitleGL)
        contentsScrollView.addSubview(youtubeReviewIsEmptyWrap)
        youtubeReviewIsEmptyWrap.addSubview(youtubeLogo)
        youtubeReviewIsEmptyWrap.addSubview(youtubeTitleGL)
        youtubeReviewIsEmptyWrap.addSubview(youtubeReviewIsEmptyGL)
        
        youtubeReviewIsEmptyWrap.addSubview(youtubeBottomLine)
        contentsScrollView.addSubview(naverReviewIsEmptyWrap)
        naverReviewIsEmptyWrap.addSubview(naverLogo)
        naverReviewIsEmptyWrap.addSubview(naverTitleGL)
        naverReviewIsEmptyWrap.addSubview(naverReviewIsEmptyGL)
        naverReviewIsEmptyWrap.addSubview(naverBottomLine)
        contentsScrollView.addSubview(tistoryReviewIsEmptyWrap)
        tistoryReviewIsEmptyWrap.addSubview(tistoryLogo)
        tistoryReviewIsEmptyWrap.addSubview(tistoryTitleGL)
        tistoryReviewIsEmptyWrap.addSubview(tistoryReviewIsEmptyGL)
        tistoryReviewIsEmptyWrap.addSubview(tistoryBottomLine)
        contentsScrollView.addSubview(pinpliReviewIsEmptyWrap)
        pinpliReviewIsEmptyWrap.addSubview(pinpliLogo)
        pinpliReviewIsEmptyWrap.addSubview(pinpliTitleGL)
        pinpliReviewIsEmptyWrap.addSubview(pinpliReviewIsEmptyGL)
        pinpliReviewIsEmptyWrap.addSubview(pinpliReviewWriteWrap)
        pinpliReviewWriteWrap.addSubview(pinpliReviewWriteGL)
        /* */

    }
    
    func autoLayout() {
        contentsScrollView.snp.makeConstraints{ (make) in
            make.top.equalTo(headerImageWrap.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        /* headerImage 영역 */
        headerImageWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 430)
            let width = currentViewSize.width
            make.top.equalTo(0)
            headerViewHeightConstraint = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.width.equalTo(width)
            make.leading.trailing.equalTo(0)
        }
        headerImageCV.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
        headerImagePageCtrl.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 16)
            let height = aspectRatio(standardSize: 7)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
            make.bottom.equalTo(-bottomRatio)
        }
        headerGradientWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 167)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
            let screenSize: CGRect = UIScreen.main.bounds
            gradientView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: height))
            gradientView?.backgroundColor = UIColor(white: 1, alpha: 0)
            gradientView?.addGradientWithColor(firstColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), lastColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0))
            gradientView?.clipsToBounds = false
            headerGradientWrap.addSubview(gradientView!)
        }
        backBtnWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 40)
            let width = aspectRatio(standardSize: 100)
            make.height.equalTo(height)
            make.width.equalTo(width)
            make.leading.equalTo(0)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        titleWrap.snp.makeConstraints{ make in
            let leftRatio = constraintRatio(direction: .left, standardSize: 11)
            let rightRatio = constraintRatio(direction: .right, standardSize: 10)
            let height = aspectRatio(standardSize: 40)
            make.leading.equalTo(backBtnImage.snp.trailing).offset(leftRatio)
            make.trailing.equalTo(reviewWriteWrap.snp.leading).offset(rightRatio)
            make.height.equalTo(height)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        titleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            titleGL.font = titleGL.font.withSize(fontSize)
            make.top.leading.trailing.bottom.equalTo(0)
        }
        backBtnImage.snp.makeConstraints{ make in
            let leftRatio = constraintRatio(direction: .left, standardSize: 6)
            let height = aspectRatio(standardSize: 22)
            let width = aspectRatio(standardSize: 13)
            
            make.leading.equalTo(leftRatio)
            make.height.equalTo(height)
            make.centerY.equalTo(backBtnWrap)
            make.width.equalTo(width)
        }
        reviewWriteWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 100)
            let height = aspectRatio(standardSize: 40)
            make.height.equalTo(height)
            make.width.equalTo(width)
            make.trailing.equalTo(0)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        reviewWriteGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            let leftRatio = constraintRatio(direction: .left, standardSize: 15)
            let fontSize = aspectRatio(standardSize: 17)
            reviewWriteGL.font = reviewWriteGL.font.withSize(fontSize)
            make.leading.equalTo(leftRatio)
            make.top.equalTo(topRatio)
        }
        /* */
        /* 상점 이름 감싸는 뷰 */
        storeTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 80)
            let width = currentViewSize.width
            make.top.leading.trailing.equalTo(0)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        bookmarkWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 70)
            make.width.height.equalTo(width)
            make.top.trailing.equalTo(0)
        }
        bookmarkImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            let height = aspectRatio(standardSize: 27)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.centerX.centerY.equalToSuperview()
        }
        openFlagGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 22)
            openFlagGL.font = openFlagGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
        }
        ratingGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 22)
            openFlagGL.font = openFlagGL.font.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(openFlagGL.snp.trailing).offset(10)
            make.trailing.equalTo(bookmarkWrap.snp.leading).offset(-10)
        }
        categoryGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 2)
            make.top.equalTo(openFlagGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(20)
            make.trailing.equalTo(bookmarkWrap.snp.leading).offset(-10)
        }
        storeTitleBottom.snp.makeConstraints{ make in
            make.top.equalTo(storeTitleWrap.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(0.5)
        }
        /* */
        /* 상점 정보 감싸는 뷰 */
        storeInfoWrap.snp.makeConstraints{ make in
//            let height = CGFloat(Int(aspectRatio(standardSize: 160)))
            let height = aspectRatio(standardSize: 160)
            make.top.equalTo(storeTitleBottom.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        storeAddressWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 19)
            let height = aspectRatio(standardSize: 21)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
//            make.top.equalTo(topRatio)
            make.top.equalToSuperview()
//            make.height.equalTo(height)
        }
        storeAddressSubjectGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            storeAddressSubjectGL.font = storeAddressSubjectGL.font.withSize(fontSize)
            make.leading.bottom.equalToSuperview()
        }
        storeAddressGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            storeAddressGL.font = storeAddressGL.font.withSize(fontSize)
            make.bottom.trailing.equalToSuperview()
            make.leading.equalTo(storeAddressSubjectGL.snp.trailing).offset(10)
        }
        storeTelWrap.snp.makeConstraints{ make in
//            let topRatio = constraintRatio(direction: .top, standardSize: 12)
//            let height = aspectRatio(standardSize: 21)
            make.top.equalTo(storeAddressWrap.snp.bottom)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(storeAddressWrap)
//            make.height.equalTo(height)
        }
        storeTelSubjectGL.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 7.5)
            let fontSize = aspectRatio(standardSize: 16)
            storeTelSubjectGL.font = storeTelSubjectGL.font.withSize(fontSize)
//            make.leading.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(-bottomRatio)
        }
        storeTelGL.snp.makeConstraints{ make in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 7.5)
            let fontSize = aspectRatio(standardSize: 16)
            storeTelGL.font = storeTelGL.font.withSize(fontSize)
            make.bottom.equalTo(-bottomRatio)
            make.trailing.equalToSuperview()
            make.leading.equalTo(storeTelSubjectGL.snp.trailing).offset(10)
        }
        storeOpenWrap.snp.makeConstraints{ make in
            make.top.equalTo(storeTelWrap.snp.bottom)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(storeTelWrap)
        }
        storeOpenSubjectGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 7)
            let fontSize = aspectRatio(standardSize: 16)
            storeOpenSubjectGL.font = storeOpenSubjectGL.font.withSize(fontSize)
            make.leading.equalToSuperview()
            make.top.equalTo(topRatio)
        }
        storeOpenGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 8)
            let fontSize = aspectRatio(standardSize: 16)
            storeOpenGL.font = storeOpenGL.font.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.trailing.equalToSuperview()
            make.leading.equalTo(storeOpenSubjectGL.snp.trailing).offset(10)
        }
        storeDescriptionWrap.snp.makeConstraints{ make in
            make.top.equalTo(storeOpenWrap.snp.bottom)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.bottom.equalToSuperview()
            make.height.equalTo(storeOpenWrap)
        }
        storeDescriptionSubjectGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            storeDescriptionSubjectGL.font = storeDescriptionSubjectGL.font.withSize(fontSize)
            make.leading.top.equalToSuperview()
            make.trailing.equalTo(storeOpenSubjectGL.snp.trailing)
        }
        storeDescriptionGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            storeDescriptionGL.font = storeDescriptionGL.font.withSize(fontSize)
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(storeDescriptionSubjectGL.snp.trailing).offset(10)
        }
        storeInfoBottom.snp.makeConstraints{ make in
            make.top.equalTo(storeInfoWrap.snp.bottom)
            make.height.equalTo(0.5)
            make.leading.trailing.equalTo(0)
        }
        /* */
        /* 상점 메뉴 감싸는 뷰 */
        storeMenuWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 95)
            make.top.equalTo(storeInfoBottom.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        storeMenuTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 12)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(topRatio)
            storeMenuTitleGL.font = storeMenuTitleGL.font.withSize(fontSize)
        }
        storeMenuIsEmptyGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 20)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(storeMenuTitleGL.snp.bottom).offset(topRatio)
            make.bottom.equalTo(-bottomRatio)
            storeMenuIsEmptyGL.font = storeMenuIsEmptyGL.font.withSize(fontSize)
        }
        storeMenuBottom.snp.makeConstraints{ make in
            make.top.equalTo(storeMenuWrap.snp.bottom)
            make.height.equalTo(0.5)
            make.leading.trailing.equalTo(0)
        }
        /* */
        /* 유튜브 리뷰 섹션 */
        reviewTitleWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 116)
            make.top.equalTo(storeMenuBottom.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        reviewTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 20)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
            make.centerY.equalToSuperview()
            reviewTitleGL.font = reviewTitleGL.font.withSize(fontSize)
        }
        youtubeReviewIsEmptyWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 106)
            make.top.equalTo(reviewTitleWrap.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        youtubeLogo.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            make.width.height.equalTo(width)
            make.leading.equalTo(24)
            make.top.equalTo(0)
            youtubeLogo.image = UIImage(named: "youtube_logo")
        }
        youtubeTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            youtubeTitleGL.text = "유튜브 리뷰"
            youtubeTitleGL.font = youtubeTitleGL.font.withSize(fontSize)
            make.leading.equalTo(youtubeLogo.snp.trailing).offset(10)
            make.trailing.equalTo(10)
            make.centerY.equalTo(youtubeLogo)
        }
        youtubeReviewIsEmptyGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 15)
            youtubeReviewIsEmptyGL.font = youtubeReviewIsEmptyGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(youtubeLogo.snp.bottom).offset(topRatio)
        }
        youtubeBottomLine.snp.makeConstraints{ make in
            youtubeBottomLine.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
            make.height.equalTo(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        naverReviewIsEmptyWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 136)
            make.top.equalTo(youtubeReviewIsEmptyWrap.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        naverLogo.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            make.width.height.equalTo(width)
            make.leading.equalTo(24)
            make.top.equalTo(topRatio)
            naverLogo.image = UIImage(named: "naver_logo")
        }
        naverTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            naverTitleGL.text = "네이버 리뷰"
            naverTitleGL.font = naverTitleGL.font.withSize(fontSize)
            make.leading.equalTo(naverLogo.snp.trailing).offset(10)
            make.trailing.equalTo(10)
            make.centerY.equalTo(naverLogo)
        }
        naverReviewIsEmptyGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 15)
            naverReviewIsEmptyGL.font = naverReviewIsEmptyGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(naverLogo.snp.bottom).offset(topRatio)
        }
        naverBottomLine.snp.makeConstraints{ make in
            naverBottomLine.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
            make.height.equalTo(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        tistoryReviewIsEmptyWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 136)
            make.top.equalTo(naverReviewIsEmptyWrap.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        tistoryLogo.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 30)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            make.width.height.equalTo(width)
            make.leading.equalTo(24)
            make.top.equalTo(topRatio)
            tistoryLogo.image = UIImage(named: "tistory_logo")
        }
        tistoryTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            tistoryTitleGL.text = "티스토리 리뷰"
            tistoryTitleGL.font = tistoryTitleGL.font.withSize(fontSize)
            make.leading.equalTo(tistoryLogo.snp.trailing).offset(10)
            make.trailing.equalTo(10)
            make.centerY.equalTo(tistoryLogo)
        }
        tistoryReviewIsEmptyGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 15)
            tistoryReviewIsEmptyGL.font = tistoryReviewIsEmptyGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(tistoryLogo.snp.bottom).offset(topRatio)
        }
        tistoryBottomLine.snp.makeConstraints{ make in
            tistoryBottomLine.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
            make.height.equalTo(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        pinpliReviewIsEmptyWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 232)
            make.top.equalTo(tistoryReviewIsEmptyWrap.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(height)
            make.bottom.equalToSuperview()
        }
        pinpliLogo.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 21)
            let height = aspectRatio(standardSize: 30)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.leading.equalTo(33)
            make.top.equalTo(topRatio)
            pinpliLogo.image = UIImage(named: "pinpli_logo")
        }
        pinpliTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            pinpliTitleGL.text = "핀플리 리뷰"
            pinpliTitleGL.font = pinpliTitleGL.font.withSize(fontSize)
            make.leading.equalTo(pinpliLogo.snp.trailing).offset(10)
            make.trailing.equalTo(10)
            make.centerY.equalTo(pinpliLogo)
        }
        pinpliReviewIsEmptyGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 15)
            pinpliReviewIsEmptyGL.text = "해당 맛집의 리뷰는 아직 없어요 :(\n내가 먼저 등록해볼까요?"
            pinpliReviewIsEmptyGL.font = pinpliReviewIsEmptyGL.font.withSize(fontSize)
            pinpliReviewIsEmptyGL.numberOfLines = 2
            pinpliReviewIsEmptyGL.setLinespace(spacing: 5)
            make.top.equalTo(pinpliLogo.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        pinpliReviewWriteWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 146)
            let height = aspectRatio(standardSize: 50)
            make.top.equalTo(pinpliReviewIsEmptyGL.snp.bottom)
            make.trailing.equalTo(0)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        pinpliReviewWriteGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.centerX.centerY.equalToSuperview()
            pinpliReviewWriteGL.font = pinpliReviewWriteGL.font.withSize(fontSize)
        }
        /* */
    }
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            
        }
    }
    @objc private func backEvent(_ gesture:UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            self?.backEvent.accept(true)
        }
    }
    @objc private func reviewWriteEvent(_ gesture:UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            self?.reviewWriteEvent.accept(true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if scrollView == headerImageCV {
            headerImagePageCtrl.currentPage = currentPage
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == contentsScrollView {
            let y: CGFloat = scrollView.contentOffset.y
            let headerViewMaxHeight:CGFloat = aspectRatio(standardSize: 430)
            let headerViewMinHeight:CGFloat = aspectRatio(standardSize: 40) + statusHeight
            let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y
            let gradientMaxHeight = aspectRatio(standardSize: 167)
    
            if newHeaderViewHeight > headerViewMaxHeight {
                headerViewHeightConstraint.constant = headerViewMaxHeight
                gradientHeightChange(height: gradientMaxHeight)

            } else if newHeaderViewHeight < headerViewMinHeight {
                headerViewHeightConstraint.constant = headerViewMinHeight
                gradientHeightChange(height: headerViewMinHeight)
            } else {
                headerViewHeightConstraint.constant = newHeaderViewHeight
                if newHeaderViewHeight <= gradientMaxHeight {
                    gradientHeightChange(height: newHeaderViewHeight)
                }
                scrollView.contentOffset.y = 0 // block scroll view
            }
        }
    }
    
    func gradientHeightChange(height:CGFloat) {
        for view in headerGradientWrap.subviews {
            view.removeFromSuperview()
        }

        let screenSize: CGRect = UIScreen.main.bounds
        gradientView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: height))
        gradientView?.backgroundColor = UIColor(white: 1, alpha: 0)
        gradientView?.addGradientWithColor(firstColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), lastColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0))
        gradientView?.clipsToBounds = false
        headerGradientWrap.addSubview(gradientView!)
    }
}

extension StoreDetailView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:StoreDetailImageCell?
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "StoreDetailImageCell", for:indexPath) as? StoreDetailImageCell)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = CGFloat(0.0)
        var height = CGFloat(0.0)
        
        width =  collectionView.frame.width
        height = collectionView.frame.height
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
}
