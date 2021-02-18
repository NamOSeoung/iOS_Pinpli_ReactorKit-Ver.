//
//  ReviewWriteStepCell03.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit
import RxCocoa
import RxSwift
import RxKeyboard
import MGStarRatingView

//리뷰 작성화면 세 번재 스탭  CollectionCell
class ReviewWriteStepCell03: BaseCollectionCell {
    
    
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.text = "간단하게 맛집의 리뷰를 작성해 주세요 😉"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.setLinespace(spacing: 5)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    
    lazy var reviewContentsCntGL:UILabel = {
        let label = UILabel()
        label.text = "0/1000"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    lazy var reviewContentsTextView:UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        textView.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1).cgColor
        textView.textContainerInset = UIEdgeInsets(top: 20,left: 20,bottom: 20,right: 20)
        return textView
    }()
    
   
    
    let disposeBag = DisposeBag()
    var callingView:Any?
    var reviewContentsFocusFlag:Bool = false
    var reviewContentsViewConstraint:NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        bindConstraints()
        
        reviewContentsTextView.rx.didBeginEditing.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.reviewContentsFocusFlag = true
            }).disposed(by: disposeBag)
        
        reviewContentsTextView.rx.didEndEditing.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.reviewContentsFocusFlag = false
            }).disposed(by: disposeBag)
        
        reviewContentsTextView.rx.text.orEmpty.asDriver()
            .drive(onNext:{ [weak self]result in
                let textCnt:Int = result.count
                self?.reviewContentsCntGL.text = String(textCnt) + "/1000"
            }).disposed(by: disposeBag)
        
    
        
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyboardHeight in
                if !((self?.reviewContentsFocusFlag) ?? false) {
                    let height = self?.aspectRatio(standardSize: 50) ?? 0.0
                    let fontSize = self?.aspectRatio(standardSize: 16) ?? 0.0
                    if let reviewWriteView = self?.callingView as? ReviewWriteView {
                        reviewWriteView.nextStepParentConstraint.constant = height + keyboardHeight
                        let reviewWriteY = (self?.reviewContentsTextView.frame.origin.y ?? 0.0) + (self?.reviewContentsTextView.frame.height ?? 0.0)
                        let nextStepParentY = reviewWriteView.nextStepParentWrap.frame.origin.y - (keyboardHeight + height)
                        reviewWriteView.previousStepGL.font = reviewWriteView.nextStepGL.font.withSize(fontSize)
                        reviewWriteView.nextStepGL.font = reviewWriteView.nextStepGL.font.withSize(fontSize)
                        if reviewWriteY > nextStepParentY {
                            self?.reviewContentsViewConstraint.constant = (self?.reviewContentsTextView.frame.height ?? 0.0) - (reviewWriteY - nextStepParentY - 10)
                        }
                    }
                }else {
                    let height = self?.aspectRatio(standardSize: 100) ?? 0.0
                    let fontSize = self?.aspectRatio(standardSize: 18) ?? 0.0
                    if let reviewWriteView = self?.callingView as? ReviewWriteView {
                        reviewWriteView.nextStepParentConstraint.constant = height + keyboardHeight
                        reviewWriteView.previousStepGL.font = reviewWriteView.nextStepGL.font.withSize(fontSize)
                        reviewWriteView.nextStepGL.font = reviewWriteView.nextStepGL.font.withSize(fontSize)
                        self?.reviewContentsTextView.snp.makeConstraints{ make in
                            let reviewContentsTextHeight = self?.aspectRatio(standardSize: 200) ?? 0.0
                            self?.reviewContentsViewConstraint.constant = reviewContentsTextHeight
                        }
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        /* 타이틀 이미지 */
        addSubview(titleGL)
        addSubview(reviewContentsCntGL)
        addSubview(reviewContentsTextView)
        /* */
    }
    
    private func bindConstraints() {
        
        /* 타이틀 */
        titleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 30)
            let width = aspectRatio(standardSize: 277)
            make.leading.equalTo(22)
            make.width.equalTo(width)
            make.top.equalToSuperview()
            titleGL.font = titleGL.font.withSize(fontSize)
        }
        /* */
        
        /* 리뷰 작성 */
        reviewContentsCntGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 12)
            reviewContentsCntGL.font = reviewContentsCntGL.font.withSize(fontSize)
            make.top.equalTo(titleGL.snp.bottom).offset(topRatio)
            make.trailing.equalTo(-22)
        }
        reviewContentsTextView.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            let height = aspectRatio(standardSize: 200)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            reviewContentsTextView.font = reviewContentsTextView.font?.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(reviewContentsCntGL.snp.bottom).offset(topRatio)
            reviewContentsViewConstraint = make.height.equalTo(height).constraint.layoutConstraints[0]
           
        }
        /* */
    }
    
    func parentViewSetting(parentView:Any) {
        callingView = parentView
    }
}
