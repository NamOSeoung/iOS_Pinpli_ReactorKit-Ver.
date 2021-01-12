//
//  PinReviewView2.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/26.
//

import UIKit

class PinReviewIsEmptyView: UIView {
    
    var aaa:Int = 0 {
        didSet {
            reviewIsEmptyContentsGL.text = "\(aaa)"
        }
    }
    
    lazy var reviewIsEmptyGL01: UILabel = {
        let label = UILabel()
        label.text = "🍔 🥗 🍟 🍖 🍘 🍚 🍜 🍤"
        label.font = label.font.withSize(25)
        return label
    }()
    
    lazy var reviewIsEmptyContentsGL: UILabel = {
        let label = UILabel()
        label.text = "아직 마음에 드는 리뷰를 발견하지 못하셨군요\n모아져 있는 리뷰를 확인하고\n마음에 드는 맛집의 리뷰를 저장해봐요 :)"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.setLinespace(spacing: 10)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    lazy var reviewIsEmptyGL02: UILabel = {
        let label = UILabel()
        label.text = "🍔 🥗 🍟 🍖 🍘 🍚 🍜 🍤"
        label.font = label.font.withSize(25)
        return label
    }()
}
