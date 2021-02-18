//
//  ReviewCommonView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit

class ReviewCommonView {
    lazy var reviewTitleWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var reviewContentsTitleGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰들을\n모아서 한 번에 확인해 보세요"
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.setLinespace(spacing: 5)
        label.textAlignment = .left
        return label
    }()
    lazy var socialReviewIsEmptyWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var reviewIsEmptyGL:UILabel = {
        let label = UILabel()
        label.text = "해당 맛집의 리뷰는 아직 없어요 :("
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        return label
    }()
    lazy var reviewLogo:UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var reviewTitleGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        label.textAlignment = .left
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var youtubeReviewWrap:UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    lazy var bottomLineView:UIView = {
        let view = UIView()
        return view
    }()
}
