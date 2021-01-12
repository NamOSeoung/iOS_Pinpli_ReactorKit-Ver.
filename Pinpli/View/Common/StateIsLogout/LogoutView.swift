//
//  LogoutView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/28.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import MapKit
import CoreLocation

class LogoutView: BaseView {
    
    lazy var loginWrap:UIView = {
        let view = UIView()
        return view
    }()
   
    lazy var loginGL:UILabel = {
        let label = UILabel()
        label.text = "로그인하고 내 마음에 드는 장소와 리뷰들을\nPin 해보세요 😎"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.setLinespace(spacing: 10)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        return label
    }()
    
    lazy var loginBtn:UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하러 가기", for: .normal)
        button.setTitleColor(r: 255, g: 255, b: 255, alpha: 1, ctrl: .normal)
        button.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        button.addTarget(self, action: #selector(didTappedFullSizeBtn), for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            
        }
    }
}
