//
//  NickNameEditView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import SnapKit
import RxCocoa
import RxKeyboard
import RxSwift

//닉네임 변경 전용 뷰
class NickNameEditViewUI: BaseView {
 
    lazy var closeWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var closeImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_24px")
        return image
    }()
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.text = "닉네임을 변경해봐요 :)"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        return label
    }()
    lazy var subTitleGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.text = "회원님만의 멋진 이름을 만들어 보아요!"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        return label
    }()
    lazy var nickNameEditWrap:UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        return view
    }()
    lazy var nickNamePlaceHolderGL:UILabel = {
        let label = UILabel()
        label.text = "리뷰없음 못살아"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    lazy var nickNameEditTF:UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        textField.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textField.textAlignment = .left
        textField.isHidden = false
        return textField
    }()
    lazy var nickNameCntGL:UILabel = {
        let label = UILabel()
        label.text = "0 / 10"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    lazy var completeWrapParent:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var completeWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
        return view
    }()
    lazy var completeGL:UILabel = {
        let label = UILabel()
        label.text = "변경하기"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    var disposeBag:DisposeBag = DisposeBag()
    weak var completeWrapParentHeight:NSLayoutConstraint! //닉네임 변경하기 감싸는 뷰 높이
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
        addSubview(titleGL)
        addSubview(subTitleGL)
        addSubview(nickNameEditWrap)
        nickNameEditWrap.addSubview(nickNamePlaceHolderGL)
        nickNameEditWrap.addSubview(nickNameEditTF)
        nickNameEditWrap.addSubview(nickNameCntGL)
        addSubview(completeWrapParent)
        completeWrapParent.addSubview(completeWrap)
        completeWrap.addSubview(completeGL)
    }
    
    private func autoLayout() {
        closeWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 110)
            let height = aspectRatio(standardSize: 50)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.leading.top.equalTo(safeAreaLayoutGuide)
        }
        closeImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 24)
            make.width.height.equalTo(width)
            make.leading.equalTo(22)
            make.centerY.equalToSuperview()
        }
        titleGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 30)
            titleGL.font = titleGL.font.withSize(fontSize)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(closeWrap.snp.bottom)
        }
        subTitleGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 19)
            subTitleGL.font = subTitleGL.font.withSize(fontSize)
            make.top.equalTo(titleGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        nickNameEditWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 53)
            let topRatio = constraintRatio(direction: .top, standardSize: 51)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(height)
            make.top.equalTo(subTitleGL.snp.bottom).offset(topRatio)
        }
        nickNamePlaceHolderGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.leading.equalTo(16)
            make.trailing.equalTo(nickNameCntGL.snp.leading).offset(-16)
            make.centerY.equalToSuperview()
            nickNamePlaceHolderGL.font = nickNamePlaceHolderGL.font.withSize(fontSize)
        }
        nickNameEditTF.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.centerY.equalToSuperview()
            nickNameEditTF.font = nickNameEditTF.font?.withSize(fontSize)
        }
        nickNameCntGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            make.trailing.equalTo(-16)
            make.centerY.equalToSuperview()
            nickNameCntGL.font = nickNameCntGL.font.withSize(fontSize)
        }
        
        completeWrapParent.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            completeWrapParentHeight = make.height.equalTo(height).constraint.layoutConstraints[0]
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        completeWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            make.height.equalTo(height)
            make.leading.top.trailing.equalToSuperview()
        }
        
        completeGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            completeGL.font = completeGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        nickNameEditTF.becomeFirstResponder()
        
        RxKeyboard.instance.visibleHeight //키보드 높이 관련 Rx 컨트롤
            .asObservable()
            .subscribe(onNext: { [weak self] keyboardHeight in
                let height = self?.aspectRatio(standardSize: 44) ?? 44
                self?.completeWrapParentHeight.constant = height + keyboardHeight
            }).disposed(by: disposeBag)
    }
    
    func completeWrapColorSetting(writeFlag:Bool) {
        if writeFlag {
            completeWrap.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
            completeGL.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
            nickNameEditTF.isHidden = false
            nickNamePlaceHolderGL.isHidden = true
        }else {
            completeWrap.setBackgroundColor(r: 196, g: 196, b: 196, alpha: 1)
            completeGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
            nickNameEditTF.isHidden = true
            nickNamePlaceHolderGL.isHidden = false
        }
    }
    
    func completeWrapSetting(keyboardHeight:CGFloat) {
        completeWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(-(keyboardHeight))
        }
        
        completeGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            completeGL.font = completeGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    //입력 텍스트 밖 영역 클릭시 키보드 내려가도록 해주는 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nickNameEditTF.text?.count ?? 0 > 0 {
            nickNamePlaceHolderGL.isHidden = true
            nickNameEditTF.isHidden = false
        }else {
            nickNamePlaceHolderGL.isHidden = false
            nickNameEditTF.isHidden = true
        }
    }
}
