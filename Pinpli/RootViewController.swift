//
//  ViewController.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/24.
//

import UIKit

class RootViewController: BaseViewController {
    
    lazy var titleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "first_view_title")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var tourBtn: UIButton = {
        let button = UIButton()
        button.setTitle("일단 둘러보기", for: .normal)
        button.setTitleColor(colorSetting(r: 0, g: 0, b: 0, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = colorSetting(r: 204, g: 204, b: 204, alpha: 1).cgColor
        button.addTarget(self, action: #selector(didTappedFullSizeBtn), for: .touchUpInside)
        return button
    }()
    
    lazy var leftGuideLine: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 224, g: 224, b: 224, alpha: 1)
        return view
    }()
    
    lazy var rightGuideLine: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 224, g: 224, b: 224, alpha: 1)
        return view
    }()
    
    lazy var loginGL: UILabel = {
        let label = UILabel()
        label.text = "로그인하기"
        label.textColor = colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        return label
    }()
    
    lazy var loginBtnWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var kakaoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnKakao"), for: .normal)
        return button
    }()
    
    lazy var appleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btnApple"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleImage)
        
        titleImage.snp.makeConstraints{ (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 152)
            let width = currentViewSize.width
            let height = aspectRatio(standardSize: 150)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.equalTo(topRatio)
        }
        
        view.addSubview(tourBtn)
        
        tourBtn.snp.makeConstraints{ (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 156)
            let height = aspectRatio(standardSize: 53)
            print(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(height)
            make.top.equalTo(titleImage.snp.bottom).offset(topRatio)
        }
        
        view.addSubview(loginGL)
        
        loginGL.snp.makeConstraints{ (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 51)
            let fontSize = aspectRatio(standardSize: 16)
            
            make.top.equalTo(tourBtn.snp.bottom).offset(topRatio)
            make.centerX.equalTo(view)
            
            loginGL.font = UIFont(name: "AppleSDGothicNeo-Regular", size: CGFloat(fontSize))
        }
        
        view.addSubview(leftGuideLine)
        
        leftGuideLine.snp.makeConstraints{ (make) in
            make.height.equalTo(1)
            make.leading.equalTo(0)
            make.trailing.equalTo(loginGL.snp.leading).offset(-7)
            
            make.centerY.equalTo(loginGL)
        }
        view.addSubview(rightGuideLine)
        
        rightGuideLine.snp.makeConstraints{ (make) in
            make.height.equalTo(1)
            make.leading.equalTo(loginGL.snp.trailing).offset(5)
            make.trailing.equalTo(0)
            
            make.centerY.equalTo(loginGL)
        }
        
        view.addSubview(loginBtnWrap)
        
        loginBtnWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 35)
            let width = aspectRatio(standardSize: 130)
            let height = aspectRatio(standardSize: 40)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.equalTo(loginGL.snp.bottom).offset(topRatio)
            make.centerX.equalToSuperview()
        }
        loginBtnWrap.addSubview(kakaoButton)
        loginBtnWrap.addSubview(appleButton)
        kakaoButton.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 40)
            make.width.height.equalTo(width)
            make.leading.equalTo(0)
        }
        appleButton.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 40)
            make.width.height.equalTo(width)
            make.trailing.equalTo(0)
        }
    }
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
                self?.present(aroundStoreVC, animated: true, completion: nil)
            }
        }
    }
}
