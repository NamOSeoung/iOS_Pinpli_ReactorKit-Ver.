//
//  MyPageLoginView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/01.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//내정보 탭 로그인 했을 시 전용 뷰
class MyPageLoginView: BaseView {
    
    lazy var summaryWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var profileImageWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileEditClickEvent(_:))))
        view.clipsToBounds = true
        return view
    }()
    lazy var changePhotoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"change_photo")
        return image
    }()
    lazy var nameEditWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nickNameEditClickEvent(_:))))
        return view
    }()
    lazy var nameEditImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "edit_24px")
        return image
    }()
    lazy var userInfoSettingsWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(myInfoClickEvent(_:))))
        return view
    }()
    lazy var userInfoSettingImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "setting_btn")
        return image
    }()
    lazy var profileImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image7")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var summaryGL:UILabel = {
        let label = UILabel()
        label.text = "나영"
        label.textAlignment = .left
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return label
    }()
    
    lazy var summaryBottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var categoryWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var myReviewWrap: UIView = {
        let view = UIView()
        view.tag = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabClickEvent(_:))))
        return view
    }()
    
    lazy var myReviewGL: UILabel = {
        let label = UILabel()
        label.text = "내 리뷰"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    
    lazy var  blackListWrap: UIView = {
        let view = UIView()
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabClickEvent(_:))))
        return view
    }()
    
    lazy var blackListGL: UILabel = {
        let label = UILabel()
        label.text = "블랙리스트"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        return label
    }()
    
    lazy var questionWrap: UIView = {
        let view = UIView()
        view.tag = 2
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabClickEvent(_:))))
        return view
    }()
    
    lazy var questionGL: UILabel = {
        let label = UILabel()
        label.text = "1:1 문의"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        return label
    }()
    
    lazy var settingsWrap: UIView = {
        let view = UIView()
        view.tag = 3
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabClickEvent(_:))))
        return view
    }()
    
    lazy var settingsGL: UILabel = {
        let label = UILabel()
        label.text = "일반 설정"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        return label
    }()
    
    lazy var categoryBottomLine: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var loginWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contentsWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    var profileEditEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var nickNameEditEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var myInfoEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    
    var myReviewEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var blackListEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var questionEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var commonSettngsEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    
    var serviceTermsEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var privacyTermsEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var faqEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var noticeEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    
    var questionWriteEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    
    var disposeBag = DisposeBag()
    var qnaDeleteEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    let questionView = QuestionView()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        addSubview(summaryWrap)
        summaryWrap.addSubview(profileImageWrap)
        profileImageWrap.addSubview(profileImage)
        summaryWrap.addSubview(changePhotoImage)
        summaryWrap.addSubview(nameEditWrap)
        nameEditWrap.addSubview(nameEditImage)
        summaryWrap.addSubview(userInfoSettingsWrap)
        userInfoSettingsWrap.addSubview(userInfoSettingImage)
        summaryWrap.addSubview(summaryGL)
        summaryWrap.addSubview(summaryBottomLine)
        addSubview(categoryWrap)
        categoryWrap.addSubview(myReviewWrap)
        categoryWrap.addSubview(blackListWrap)
        categoryWrap.addSubview(questionWrap)
        categoryWrap.addSubview(settingsWrap)
        categoryWrap.addSubview(categoryBottomLine)
        myReviewWrap.addSubview(myReviewGL)
        blackListWrap.addSubview(blackListGL)
        questionWrap.addSubview(questionGL)
        settingsWrap.addSubview(settingsGL)
        
    }
    
    func autoLayout() {
        
        /* summary 영역 */
        summaryWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 94)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        
        profileImageWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 50)
            make.size.equalTo(height)
            make.leading.equalTo(22)
            make.centerY.equalToSuperview()
            profileImageWrap.layer.cornerRadius = height/2
        }
        profileImage.snp.makeConstraints{ make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        changePhotoImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 18)
            make.width.height.equalTo(width)
            make.trailing.bottom.equalTo(profileImageWrap)
        }
        nameEditWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 50)
            make.width.height.equalTo(width)
            make.leading.equalTo(summaryGL.snp.trailing)
            make.centerY.equalToSuperview()
        }
        nameEditImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 18)
            let leftRatio = constraintRatio(direction: .left, standardSize: 4)
            make.width.height.equalTo(width)
            make.centerY.equalToSuperview()
            make.leading.equalTo(leftRatio)
        }
        userInfoSettingsWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 50)
            make.width.height.equalTo(width)
            make.trailing.equalTo(-9)
            make.centerY.equalToSuperview()
        }
        userInfoSettingImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 20)
            make.width.height.equalTo(width)
            make.centerY.centerX.equalToSuperview()
        }
        summaryGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.centerY.equalTo(summaryWrap)
            make.leading.equalTo(profileImageWrap.snp.trailing).offset(10)
            summaryGL.font = summaryGL.font.withSize(fontSize)
        }
        summaryBottomLine.snp.makeConstraints{ make in
            make.bottom.equalTo(0)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        /* */
        
        /* 카테고리 영역 */
        categoryWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 44)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
            make.top.equalTo(summaryWrap.snp.bottom)
        }
        
        myReviewWrap.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(0)
        }
        
        blackListWrap.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(myReviewWrap.snp.trailing)
            make.width.equalTo(myReviewWrap)
        }
        
        questionWrap.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(blackListWrap.snp.trailing)
            make.width.equalTo(blackListWrap)
        }
        
        settingsWrap.snp.makeConstraints{ make in
            make.top.bottom.trailing.equalTo(0)
            make.leading.equalTo(questionWrap.snp.trailing)
            make.width.equalTo(questionWrap)
        }
        
        categoryBottomLine.snp.makeConstraints{ make in
            make.bottom.equalTo(0)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        myReviewGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.leading.trailing.equalTo(0)
            myReviewGL.font = myReviewGL.font.withSize(fontSize)
        }
        
        blackListGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.leading.trailing.equalTo(0)
            blackListGL.font = blackListGL.font.withSize(fontSize)
        }
        
        questionGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.leading.trailing.equalTo(0)
            questionGL.font = questionGL.font.withSize(fontSize)
        }
        
        settingsGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.bottom.leading.trailing.equalTo(0)
            settingsGL.font = settingsGL.font.withSize(fontSize)
        }
        
        /* */
    }
    
    @objc private func tabClickEvent(_ gesture: UITapGestureRecognizer) {
        disposeBag = DisposeBag()
        myReviewGL.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        blackListGL.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        questionGL.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        settingsGL.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        gesture.view?.showAnimation { [weak self] in
            if let tag = gesture.view?.tag {
                if tag == 0 {
                    self?.myReviewEvent.accept(true)
                    self?.myReviewGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
                }else if tag == 1 {
                    self?.blackListEvent.accept(true)
                    self?.blackListGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
                }else if tag == 2 {
                    self?.questionEvent.accept(true)
                    self?.questionGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
                }else {
                    self?.commonSettngsEvent.accept(true)
                    self?.settingsGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
                }
            }
        }
    }
    
    @objc private func profileEditClickEvent(_ gesture: UITapGestureRecognizer) {
        profileEditEvent.accept(true)
    }
    
    @objc private func nickNameEditClickEvent(_ gesture: UITapGestureRecognizer) {
        nickNameEditEvent.accept(true)
    }
    
    @objc private func myInfoClickEvent(_ gesture: UITapGestureRecognizer) {
        myInfoEvent.accept(true)
    }
    
    func contentsSetting(tabGubun:Int) {
        for view in subviews {
            if view == contentsWrap {
                for child in view.subviews {
                    child.removeFromSuperview()
                }
            }
        }
        addSubview(contentsWrap)
        contentsWrap.snp.makeConstraints { (make) in
            make.top.equalTo(categoryWrap.snp.bottom)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        if tabGubun == 0 { //내 리뷰
            myReviewTab()
        }else if tabGubun == 1 { //블랙리스트
            blackListTab()
        }else if tabGubun == 2 { //1:1문의
            questionSettingTab()
        }else { //일반 설정
            commonSettingsTab()
        }
    }
    //내 리뷰 목록
    func myReviewTab() {
        let myReviewView = MyReviewView()
        contentsWrap.addSubview(myReviewView.reviewIsEmptyWrap)
        myReviewView.reviewIsEmptyWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 103)
            let topRatio = constraintRatio(direction: .top, standardSize: 160)
            make.height.equalTo(height)
            make.top.equalTo(topRatio)
            make.leading.trailing.equalToSuperview()
        }
    }
    //블랙리스트
    func blackListTab() {
        let blackListView = BlackListView()
        contentsWrap.addSubview(blackListView.blackListReviewGubunWrap)
        contentsWrap.addSubview(blackListView.blackListContentsSelectWrap)
        blackListView.blackListReviewGubunWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            make.height.equalTo(height)
            make.leading.top.trailing.equalToSuperview()
        }
        
        blackListView.blackListContentsSelectWrap.snp.makeConstraints { (make) in
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 25)
            let height = aspectRatio(standardSize: 44)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.bottom.equalToSuperview().offset(-bottomRatio)
            make.height.equalTo(height)
        }
        
        blackListView.youtubeWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ result in
                blackListView.reviewSelectBottomSetting(reviewGubun: 0)
            }).disposed(by: disposeBag)
        blackListView.naverWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ result in
                blackListView.reviewSelectBottomSetting(reviewGubun: 1)
            }).disposed(by: disposeBag)
        blackListView.tistoryWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ result in
                blackListView.reviewSelectBottomSetting(reviewGubun: 2)
            }).disposed(by: disposeBag)
        
        blackListView.writerWrap.rx.tapGesture().asDriver().skip(1)
            .drive(onNext:{ result in
                blackListView.blackListContentsSelectSetting(gubun: 0)
            }).disposed(by: disposeBag)
        blackListView.postWrap.rx.tapGesture().asDriver().skip(1)
            .drive(onNext:{ result in
                blackListView.blackListContentsSelectSetting(gubun: 1)
            }).disposed(by: disposeBag)
    }
    
    //1:1문의
    func questionSettingTab() {
        
        contentsWrap.addSubview(questionView.managerQuestionWrap)
        contentsWrap.addSubview(questionView.questionWrap)
        questionView.managerQuestionWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            let height = aspectRatio(standardSize: 44)
            make.top.equalTo(topRatio)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        questionView.questionWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 12)
            make.top.equalTo(questionView.managerQuestionWrap.snp.bottom).offset(topRatio)
            make.leading.trailing.bottom.equalToSuperview()
            questionView.questionListTV.dataSource = self
            questionView.questionListTV.delegate = self
        }
        questionView.questionIsEmptyCtrl(questionCnt: 1)

        questionView.managerQuestionWrap.rx.tapGesture().asDriver()
            .skip(1)
            .drive(onNext:{ [weak self] result in
                result.view?.showAnimation { [weak self] in
                    self?.questionWriteEvent.accept(true)
                }
            }).disposed(by: disposeBag)
    }
    
    //일반 설정
    func commonSettingsTab() {
        let commonSettingsView = CommonSettingsView()
        contentsWrap.addSubview(commonSettingsView.serviceTermsWrap)
        contentsWrap.addSubview(commonSettingsView.privacyTermsWrap)
        contentsWrap.addSubview(commonSettingsView.faqWrap)
        contentsWrap.addSubview(commonSettingsView.noticeWrap)
        contentsWrap.addSubview(commonSettingsView.appInfoWrap)
        
        commonSettingsView.serviceTermsWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 50)
            let topRatio = constraintRatio(direction: .top, standardSize: 9)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(categoryWrap.snp.bottom).offset(topRatio)
        }
        commonSettingsView.privacyTermsWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 1)
            let height = aspectRatio(standardSize: 50)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(commonSettingsView.serviceTermsWrap.snp.bottom).offset(topRatio)
        }
        commonSettingsView.faqWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 1)
            let height = aspectRatio(standardSize: 50)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(commonSettingsView.privacyTermsWrap.snp.bottom).offset(topRatio)
        }
        commonSettingsView.noticeWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 1)
            let height = aspectRatio(standardSize: 50)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(commonSettingsView.faqWrap.snp.bottom).offset(topRatio)
        }
        commonSettingsView.appInfoWrap.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 1)
            let height = aspectRatio(standardSize: 50)
            make.height.equalTo(height)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(commonSettingsView.noticeWrap.snp.bottom).offset(topRatio)
        }
        
        commonSettingsView.serviceTermsWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ [weak self] result in
                self?.serviceTermsEvent.accept(true)
            }).disposed(by: disposeBag)
        commonSettingsView.privacyTermsWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ [weak self] result in
                self?.privacyTermsEvent.accept(true)
            }).disposed(by: disposeBag)
        commonSettingsView.faqWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ [weak self] result in
                self?.faqEvent.accept(true)
            }).disposed(by: disposeBag)
        commonSettingsView.noticeWrap.rx.tapGesture().asDriver()
            .drive(onNext:{ [weak self] result in
                self?.noticeEvent.accept(true)
            }).disposed(by: disposeBag)
    }
    
    
}

extension MyPageLoginView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let questionCell: QuestionCell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell
        
        return questionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //          guard let interestProfileList = self.interestProfileReturn?.data.interestProfileList else { return UISwipeActionsConfiguration(actions: []) }
        
        var swipeActionConfig = UISwipeActionsConfiguration(actions: [])
        //        let profileCnt:Int = interestProfileList.count
        
        //스와이프 풀 삭제
        let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            self?.qnaDeleteEvent.accept(true)
            //swipe 된 부분 취소하기위한 구문
            tableView.isEditing = false
            
            //                let profileId:String = interestProfileList[indexPath.row].profileId
            //                let mainProfileFlag:Bool = interestProfileList[indexPath.row].mainProfileFlag
            
//            let alert = UIAlertController(title: "다른 프로필을 대표 프로필로 설정해주세요", message: "\n대표 프로필은 삭제할 수 없어요 :(\n다른 프로필을 대표로 설정한 다음에\n해당 프로필을 삭제해주세요", preferredStyle: .alert)
//            //                                         // Change font and color of title
//            //
//            alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
//            //
//            alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
//            //
//            //
//            let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
//            //
//            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (action:UIAlertAction!) in
//                //
//                //
//            }))
//            subview.backgroundColor = UIColor.white
////            present(alert, animated: true)
//            success(true)
            
            //                if mainProfileFlag {
            //                    let alert = UIAlertController(title: "다른 프로필을 대표 프로필로 설정해주세요", message: "\n대표 프로필은 삭제할 수 없어요 :(\n다른 프로필을 대표로 설정한 다음에\n해당 프로필을 삭제해주세요", preferredStyle: .alert)
            //                                         // Change font and color of title
            //
            //                    alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
            //
            //                    alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
            //
            //
            //                        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            //
            //                        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (action:UIAlertAction!) in
            //
            //
            //                        }))
            //                        subview.backgroundColor = UIColor.white
            ////                        self.present(alert, animated: true)
            //                        success(true)
            //                }else {
            //                    let alert = UIAlertController(title: "선택한 닉네임을 삭제하시겠습니까?", message: "\n닉네임을 삭제하면 그동안 써왔던\n게시물은 다 삭제되고 복구할 수 없어요 :(", preferredStyle: .alert)
            //
            //                    alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
            //
            //                    alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
            //
            //
            //                        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            //
            //                        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (action:UIAlertAction!) in
            //                           deleteInterestProfile(callingView: self as Any, profileId: profileId)
            //
            //                           }))
            //                        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (action:UIAlertAction!) in
            //
            //                          tableView.deselectRow(at: indexPath, animated: true)
            //
            //                        }))
            //
            //                        subview.backgroundColor = UIColor.white
            //                        self.present(alert, animated: true)
            //                        success(true)
            //                }
        })
        
        deleteAction.title = "삭제하기"
        deleteAction.backgroundColor = UIColor(red:235/255, green: 87/255, blue: 87/255, alpha: 1)
        
        swipeActionConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        
        return swipeActionConfig
    }
}
