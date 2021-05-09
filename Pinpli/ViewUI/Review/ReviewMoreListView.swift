//
//  ReviewMoreListView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/21.
//

import UIKit
import RxCocoa
import RxKeyboard
import RxSwift

class ReviewMoreListView: BaseView {
    lazy var reviewMoreListHeaderWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
        return view
    }()
    
    lazy var reviewMoreListHeaderBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var reviewLogoImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var reviewTitleGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.textAlignment = .center
        return label
    }()
    
    lazy var backBtnWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var backBtnImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back_189")
        return image
    }()
    
    lazy var reviewListTV:UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .white
        table.separatorStyle = .none
        
        return table
    }()
    
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var cellTouchEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var reviewGubun:Int = 0
    var reviewList:[Int] = [0,1,2]
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(reviewMoreListHeaderWrap)
        reviewMoreListHeaderWrap.addSubview(backBtnWrap)
        reviewMoreListHeaderWrap.addSubview(reviewMoreListHeaderBottom)
        backBtnWrap.addSubview(backBtnImage)
        reviewMoreListHeaderWrap.addSubview(reviewTitleGL)
        reviewMoreListHeaderWrap.addSubview(reviewLogoImage)
        addSubview(reviewListTV)
    }
    
    private func autoLayout() {
        backBtnWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 44)
            let width = currentViewSize.width/2
            make.leading.top.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        reviewMoreListHeaderBottom.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        backBtnImage.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 22)
            let leftRatio = constraintRatio(direction: .left, standardSize: 12)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
            make.height.equalTo(height)
        }
        reviewMoreListHeaderWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 43)
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(height)
        }
        reviewListTV.snp.makeConstraints{ make in
            make.top.equalTo(reviewMoreListHeaderWrap.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            //            reviewListTV.estimatedRowHeight = 100
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        backEvent.accept(true)
    }
    
    func reviewTitleSetting(reviewGubun:Int) {
        var title:String = "유튜브 리뷰 모아보기"
        var logoImage = UIImage(named: "youtube_logo")
        reviewListTV.register(ReviewMoreSocialCell.self,
                       forCellReuseIdentifier: "ReviewMoreSocialCell")
        if reviewGubun == 1 {
            title = "네이버 리뷰 모아보기"
            logoImage = UIImage(named: "naver_logo")
        }else if reviewGubun == 2 {
            title = "티스토리 리뷰 모아보기"
            logoImage = UIImage(named: "tistory_logo")
        }else if reviewGubun == 3 {
            title = "핀플리 리뷰 모아보기"
            logoImage = UIImage(named: "pinpli_logo")
            reviewListTV.register(ReviewMoreListPinpliCell.self,
                           forCellReuseIdentifier: "ReviewMoreListPinpliCell")
        }
        
        reviewTitleGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            reviewTitleGL.font = reviewTitleGL.font.withSize(fontSize)
            reviewTitleGL.text = title
            make.centerX.centerY.equalToSuperview()
        }
        
        reviewLogoImage.snp.makeConstraints{ make in
            let socialWidth = aspectRatio(standardSize: 16)
            let pinpliWidth = aspectRatio(standardSize: 11)
            let pinpliHeight = aspectRatio(standardSize: 16)
            reviewLogoImage.image = logoImage
            if reviewGubun == 3 {
                make.width.equalTo(pinpliWidth)
                make.height.equalTo(pinpliHeight)
            }else {
                make.width.height.equalTo(socialWidth)
            }
            make.trailing.equalTo(reviewTitleGL.snp.leading).offset(-6)
            make.centerY.equalToSuperview()
        }
    }
}

extension ReviewMoreListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if reviewGubun == 0 { //유튜브 리뷰
            let reviewMoreSocialCell: ReviewMoreSocialCell = tableView.dequeueReusableCell(withIdentifier: "ReviewMoreSocialCell") as! ReviewMoreSocialCell
            reviewMoreSocialCell.rowDataSetting(socialGubun: 2, thumbnailUrl: "", contents: "컨텐츠다잉")
            //            areaSecondCell.areaNameGL.text = areaSecondList[indexPath.row].areaName
//            reviewMoreSocialCell.rowDataSetting()
            return reviewMoreSocialCell
        }else  if reviewGubun == 1 { //네이버 리뷰
             let reviewMoreSocialCell: ReviewMoreSocialCell = tableView.dequeueReusableCell(withIdentifier: "ReviewMoreSocialCell") as! ReviewMoreSocialCell
            
            //            areaSecondCell.areaNameGL.text = areaSecondList[indexPath.row].areaName
            reviewMoreSocialCell.rowDataSetting(socialGubun: 2, thumbnailUrl: "", contents: "컨텐츠")
//            reviewMoreSocialCell.rowDataSetting()
            return reviewMoreSocialCell
        }else if reviewGubun == 2 { //티스토리 리뷰
            let reviewMoreSocialCell: ReviewMoreSocialCell = tableView.dequeueReusableCell(withIdentifier: "ReviewMoreSocialCell") as! ReviewMoreSocialCell
            
            //            areaSecondCell.areaNameGL.text = areaSecondList[indexPath.row].areaName
//            reviewMoreSocialCell.rowDataSetting()
            return reviewMoreSocialCell
        }else { //핀플리 리뷰
            let reviewMoreListPinpliCell: ReviewMoreListPinpliCell = tableView.dequeueReusableCell(withIdentifier: "ReviewMoreListPinpliCell") as! ReviewMoreListPinpliCell
            
            //            areaSecondCell.areaNameGL.text = areaSecondList[indexPath.row].areaName
            return reviewMoreListPinpliCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
        cellTouchEvent.accept(true)
    }
}
