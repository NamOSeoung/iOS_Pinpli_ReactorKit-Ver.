//
//  ReviewWriteView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit
import RxCocoa
import RxKeyboard
import RxSwift

class ReviewWriteView: BaseView {
    lazy var reviewWriteHeaderWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var backBtnWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
        return view
    }()
    lazy var backImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_24px")
        return image
    }()
    lazy var pageCtrl:UIPageControl = {
        let pageCtrl = UIPageControl()
        pageCtrl.currentPage = 0
        pageCtrl.pageIndicatorTintColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPageIndicatorTintColor = .black
        return pageCtrl
    }()
    lazy var reviewContentsCV:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
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
        collectionView.register(ReviewWriteStepCell01.self, forCellWithReuseIdentifier: "ReviewWriteStepCell01")
        collectionView.register(ReviewWriteStepCell02.self, forCellWithReuseIdentifier: "ReviewWriteStepCell02")
        collectionView.register(ReviewWriteStepCell03.self, forCellWithReuseIdentifier: "ReviewWriteStepCell03")
        return collectionView
    }()
    lazy var nextStepParentWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    
    lazy var nextStepWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepUIChange(_:))))
        return view
    }()
    lazy var nextStepGL:UILabel = {
        let label = UILabel()
        label.text = "다음단계로 넘어가기"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    lazy var previousStepGL:UILabel = {
        let label = UILabel()
        label.text = "이전 단계"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    lazy var previousStep2Wrap:UIView = {
        let view = UIView()
        view.tag = 0
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepUIChange(_:))))
        return view
    }()
    lazy var nextStep2Wrap:UIView = {
        let view = UIView()
        view.tag = 2
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepUIChange(_:))))
        return view
    }()
    
    lazy var previousStep3Wrap:UIView = {
        let view = UIView()
        view.tag = 1
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepUIChange(_:))))
        return view
    }()
    lazy var nextStep3Wrap:UIView = {
        let view = UIView()
        view.tag = 3
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextStepUIChange(_:))))
        return view
    }()
    let disposeBag = DisposeBag()
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var imageSelectEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var nextStepParentConstraint:NSLayoutConstraint!
    var reviewContentsFocusFlag:Bool = false
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        addSubview(reviewWriteHeaderWrap)
        reviewWriteHeaderWrap.addSubview(backBtnWrap)
        backBtnWrap.addSubview(backImage)
        reviewWriteHeaderWrap.addSubview(pageCtrl)
        addSubview(reviewContentsCV)
        addSubview(nextStepParentWrap)
        nextStepParentWrap.addSubview(nextStepWrap)
        nextStepWrap.addSubview(nextStepGL)
    }
    
    func autoLayout() {
        reviewWriteHeaderWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(height)
        }
        backBtnWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 110)
            make.width.equalTo(width)
            make.leading.top.bottom.equalToSuperview()
        }
        backImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 24)
            make.width.height.equalTo(width)
            make.leading.equalTo(22)
            make.centerY.equalToSuperview()
        }
        pageCtrl.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        reviewContentsCV.snp.makeConstraints{ make in
            make.top.equalTo(reviewWriteHeaderWrap.snp.bottom)
            make.bottom.equalTo(nextStepParentWrap)
            make.leading.trailing.equalToSuperview()
        }
        nextStepParentWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 100)
            nextStepParentConstraint = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.leading.bottom.trailing.equalToSuperview()
            
        }
        nextStepWrap.snp.makeConstraints{ make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        nextStepGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 18)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            nextStepGL.font = nextStepGL.font.withSize(fontSize)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(topRatio)
        }
    }
    
    @objc private func imageClickEvent(_ sender: UIButton) {
        imageSelectEvent.accept(true)
    }
    
    @objc func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
    
    @objc func nextStepUIChange(_ gesture:UITapGestureRecognizer) {
        let tag = gesture.view?.tag ?? 0
        
        
        
        if tag < 3 {
            
            for view in subviews {
                if view == nextStepParentWrap {
                    for child in view.subviews {
                        child.removeFromSuperview()
                    }
                }
            }
            
            pageCtrl.currentPage = tag
            reviewContentsCV.scrollToItem(at: IndexPath(row: tag, section: 0), at: .left, animated: true)
            
            if tag == 0 {
                nextStepParentWrap.addSubview(nextStepWrap)
                nextStepWrap.addSubview(nextStepGL)
                nextStepWrap.snp.makeConstraints{ make in
                    make.leading.top.bottom.trailing.equalToSuperview()
                }
                nextStepGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 18)
                    let topRatio = constraintRatio(direction: .top, standardSize: 20)
                    nextStepGL.font = nextStepGL.font.withSize(fontSize)
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(topRatio)
                }
            } else if tag == 1 {
                nextStepParentWrap.addSubview(previousStep2Wrap)
                nextStepParentWrap.addSubview(nextStep2Wrap)
                previousStep2Wrap.addSubview(previousStepGL)
                nextStep2Wrap.addSubview(nextStepGL)
                previousStep2Wrap.snp.makeConstraints{ make in
                    make.top.leading.bottom.equalToSuperview()
                    make.width.equalTo((currentViewSize.width/2) - 0.5)
                }
                previousStepGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 18)
                    let topRatio = constraintRatio(direction: .top, standardSize: 20)
                    previousStepGL.font = previousStepGL.font.withSize(fontSize)
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(topRatio)
                }
                nextStep2Wrap.snp.makeConstraints{ make in
                    make.leading.equalTo(previousStep2Wrap.snp.trailing).offset(0.5)
                    make.top.bottom.trailing.equalToSuperview()
                }
                nextStepGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 18)
                    let topRatio = constraintRatio(direction: .top, standardSize: 20)
                    nextStepGL.font = nextStepGL.font.withSize(fontSize)
                    nextStepGL.text = "다음단계로 넘어가기"
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(topRatio)
                }
            } else if tag == 2 {
                nextStepParentWrap.addSubview(previousStep3Wrap)
                nextStepParentWrap.addSubview(nextStep3Wrap)
                previousStep3Wrap.addSubview(previousStepGL)
                nextStep3Wrap.addSubview(nextStepGL)
                previousStep3Wrap.snp.makeConstraints{ make in
                    make.top.leading.bottom.equalToSuperview()
                    make.width.equalTo((currentViewSize.width/2) - 0.5)
                }
                previousStepGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 18)
                    let topRatio = constraintRatio(direction: .top, standardSize: 20)
                    previousStepGL.font = previousStepGL.font.withSize(fontSize)
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(topRatio)
                }
                nextStep3Wrap.snp.makeConstraints{ make in
                    make.leading.equalTo(previousStep3Wrap.snp.trailing).offset(0.5)
                    make.top.bottom.trailing.equalToSuperview()
                }
                nextStepGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 18)
                    let topRatio = constraintRatio(direction: .top, standardSize: 20)
                    nextStepGL.font = nextStepGL.font.withSize(fontSize)
                    nextStepGL.text = "리뷰 작성 완료"
                    make.leading.trailing.equalToSuperview()
                    make.top.equalTo(topRatio)
                }
            }
        }else { // tag == 3
            
        }
        endEditing(true) //키보드 내리기
    }
}
extension ReviewWriteView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewWriteStepCell01", for:indexPath) as? ReviewWriteStepCell01)
            return cell!
        }else if indexPath.row == 1 {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewWriteStepCell02", for:indexPath) as? ReviewWriteStepCell02)
            cell?.addPhotoBtn.addTarget(self, action: #selector(imageClickEvent), for: .touchUpInside)
            cell?.noPhotoUISetting(x: nextStepParentWrap.frame.height)
            return cell!
        }else {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewWriteStepCell03", for:indexPath) as? ReviewWriteStepCell03)
            cell?.parentViewSetting(parentView: self as Any)
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        endEditing(true) //키보드 내리기
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
