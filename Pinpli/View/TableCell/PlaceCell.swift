//
//  PlaceCell.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit
import Kingfisher

class PlaceCell:BaseTableCell {
    
    lazy var contentsViewWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var thumbnailWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 224, g: 224, b: 224, alpha: 1)
        return view
    }()
    
    lazy var contentsWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var bottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var thumbnailIsNullImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thumbnail_is_null")
        return image
    }()
    
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var openFlagGL:UILabel = {
        let label = UILabel()
        label.text = "영업중"
        label.colorSetting(r: 111, g: 207, b: 15, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var storeNameGL:UILabel = {
        let label = UILabel()
        label.text = "올리앤올리앤올리앤올리앤올리앤올리앤올리앤올리앤"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        return label
    }()
    
    lazy var storeCategoryGL:UILabel = {
        let label = UILabel()
        label.text = "족발 전문점"
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var ratingWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ratingGL: UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★  4.2"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var reviewMoreWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var reviewMoreGL: UILabel = {
        let label = UILabel()
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.text = "14개의 리뷰 모아보기 >"
        return label
    }()
    
    lazy var bookmarkImageWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var bookmarkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bookmark_off")
        return image
    }()
    
    
    lazy var borderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        contentView.addSubview(contentsViewWrap)
        contentsViewWrap.addSubview(thumbnailWrap)
        contentsViewWrap.addSubview(contentsWrap)
        contentsWrap.addSubview(openFlagGL)
        contentsWrap.addSubview(storeNameGL)
        contentsWrap.addSubview(storeCategoryGL)
        contentsWrap.addSubview(ratingWrap)
        ratingWrap.addSubview(ratingGL)
        contentsWrap.addSubview(reviewMoreWrap)
        reviewMoreWrap.addSubview(reviewMoreGL)
        contentsViewWrap.addSubview(bookmarkImageWrap)
        bookmarkImageWrap.addSubview(bookmarkImage)
        thumbnailWrap.addSubview(thumbnailIsNullImage)
        thumbnailWrap.addSubview(thumbnailImage)
        contentView.addSubview(bottomLine)
        //        contentView.addSubview(thumbnailWrap)
        //        contentsViewWrap.addSubview(areaNameGL)
        
        //        contentView.addSubview(borderRight)
        //        contentView.addSubview(borderBottom)
    }
    
    private func autoLayout() {
        
        contentsViewWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 204)

            make.top.bottom.leading.trailing.equalTo(contentView)
            make.height.equalTo(Int(height))
        }
        thumbnailWrap.snp.makeConstraints{ make in
            make.leading.equalTo(22)
            make.top.equalTo(22)
            make.width.equalTo((currentViewSize.width/2) - 22)
            make.bottom.equalTo(-22)
        }
        contentsWrap.snp.makeConstraints{ make in
            make.leading.equalTo(thumbnailWrap.snp.trailing).offset(14)
            make.top.equalTo(22)
            //            make.width.equalTo((currentViewSize.width/2) - 22)
            make.trailing.equalTo(-22)
            make.bottom.equalTo(-22)
        }
        bottomLine.snp.makeConstraints{ make in
            make.bottom.equalTo(0)
            make.width.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        openFlagGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(3)
            make.leading.equalTo(0)
            openFlagGL.font = openFlagGL.font.withSize(fontSize)
        }
        storeNameGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 18)
            let constraint = constraintRatio(direction: .top, standardSize: 13)
            make.top.equalTo(openFlagGL.snp.bottom).offset(constraint)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            storeNameGL.font = storeNameGL.font.withSize(fontSize)
        }
        storeCategoryGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.top.equalTo(storeNameGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            storeCategoryGL.font = storeCategoryGL.font.withSize(fontSize)
        }
        ratingWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 17)
            let height = aspectRatio(standardSize: 22)
            make.top.equalTo(storeCategoryGL.snp.bottom).offset(topRatio)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
        }
        ratingGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            ratingGL.font = ratingGL.font.withSize(fontSize)
            make.top.bottom.leading.bottom.equalTo(0)
        }
        
        /* 리뷰 모아보기 버튼 부분 */
        reviewMoreWrap.snp.makeConstraints{ make in
            make.top.equalTo(ratingWrap.snp.bottom).offset(1)
            make.bottom.equalTo(contentView)
            make.trailing.equalTo(0)
            make.leading.trailing.equalTo(0)
        }
        
        reviewMoreGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            reviewMoreGL.font = reviewMoreGL.font.withSize(fontSize)
            make.bottom.equalTo(contentsWrap)
            make.leading.trailing.equalTo(0)
        }
        /* */
        
        /* 찜하기 아이콘 부분 */
        bookmarkImageWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            make.top.equalTo(10)
            make.trailing.equalTo(-13)
            make.width.height.equalTo(height)
        }
        
        bookmarkImage.snp.makeConstraints{ make in
            make.top.equalTo(12)
            make.leading.equalTo(9)
            make.trailing.equalTo(-9)
            make.bottom.equalTo(-11)
        }
        /* */
        
        thumbnailIsNullImage.snp.makeConstraints{ make in
            make.width.equalTo(43)
            make.height.equalTo(50)
            make.centerX.centerY.equalTo(thumbnailWrap)
        }
        thumbnailImage.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
    }
    
    func placeInfoSetting(place:PlaceListModel) {
        let decoder = JSONDecoder()
        
        let placeName = place.placeName ?? ""
        let category = place.categoryName ?? ""
        let daumReviewCnt:Int = Int(place.daumBlogCount ?? "0") ?? 0
        let naverReviewCnt:Int = Int(place.naverBlogCount ?? "0") ?? 0
        let youtubeReviewCnt:Int = Int(place.youtubeReviewCount ?? "0") ?? 0
        let googleReviewCnt:Int = Int(place.googleReviewCount ?? "0") ?? 0
        let appReviewCnt:Int = Int(place.appReviewCount ?? "0") ?? 0
        let totalReviewCnt:Int = daumReviewCnt + naverReviewCnt + youtubeReviewCnt + googleReviewCnt + appReviewCnt
        let openHours = place.openHours //영업시간
        let blogThumbnailUrl:String = place.blogThumbnail ?? ""
        
        let data = openHours?.data(using: .utf8) // json형식을 Data타입으로 변경
        // data타입을 인스턴스 타입으로 변경
        if let data = data, let openHoursModel = try? decoder.decode(OpenHoursModel.self, from: data){
            let cal = Calendar(identifier: .gregorian)
            let now = Date()
            let comps = cal.dateComponents([.weekday], from: now)
            
            //* 일요일 1 ~ 토요일 7
            dayOfWeekend(day: comps.weekday ?? 1, openHours: openHoursModel)
        }
        
        /* 이미지 비동기 세팅 */
        
        if blogThumbnailUrl != "" {
            if let url = URL(string: blogThumbnailUrl) {
                thumbnailImage.kf.setImage(with: url)
                thumbnailIsNullImage.isHidden = true
                thumbnailImage.isHidden = false
            }
        }else {
            thumbnailIsNullImage.isHidden = false
            thumbnailImage.isHidden = true
        }
        
        
        if let appRating = place.appRating {
            ratingSetting(rating: appRating)
        }else {
            let googleRating = place.googleRating ?? "0.0"
            ratingSetting(rating: googleRating)
        }
        
        storeNameGL.text = placeName
        storeCategoryGL.text = category + " 전문점"
        reviewMoreGL.text = String(totalReviewCnt) + "개의 리뷰 모아보기 >"
    }
    
    //별점 세팅
    func ratingSetting(rating:String){
        let ratingInt:Int = Int(Double(rating) ?? 0.0)
        if ratingInt == 0 {
            ratingGL.text = String(rating)
        }else if ratingInt == 1 {
            ratingGL.text = "★  " + String(rating)
        }else if ratingInt == 2 {
            ratingGL.text = "★ ★  " + String(rating)
        }else if ratingInt == 3 {
            ratingGL.text = "★ ★ ★  " + String(rating)
        }else if ratingInt == 4 {
            ratingGL.text = "★ ★ ★ ★  " + String(rating)
        }else {
            ratingGL.text = "★ ★ ★ ★ ★  " + String(rating)
        }
    }

    func dayOfWeekend(day:Int,openHours:OpenHoursModel) {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        //        print(dateFormatter.string(from: now))
        
        switch day {
        case 1:
            //            print(openHours.sun?.open)
            //            print(openHours.sun?.close)
            break
        case 2:
            //            print(openHours.mon?.open)
            //            print(openHours.mon?.close)
            break
        case 3:
            //            print(openHours.tue?.open)
            //            print(openHours.tue?.close)
            break
        case 4:
            //            print(openHours.wed?.open)
            //            print(openHours.wed?.close)
            break
        case 5:
            //            print(openHours.thu?.open)
            //            print(openHours.thu?.close)
            break
        case 6:
            //            print(openHours.fri?.open)
            //            print(openHours.fri?.close)
            break
        case 7:
            //            print(openHours.sat?.open)
            //            print(openHours.sat?.close)
            break
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
