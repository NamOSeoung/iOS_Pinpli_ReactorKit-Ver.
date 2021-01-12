//
//  MyPageLogoutView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/28.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//내정보 탭 로그아웃 시 전용 뷰
class MyPageLogoutView: BaseView {

    lazy var summaryWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var defaultProfileImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "default_profile")
        return image
    }()
   
    lazy var summaryGL:UILabel = {
        let label = UILabel()
        label.text = "로그인을 해주세요 😎"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.textAlignment = .left
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
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
    
    lazy var contentsWrap: UIView = {
        let view = UIView()
        return view
    }()
    
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
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        addSubview(summaryWrap)
        summaryWrap.addSubview(defaultProfileImage)
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
        addSubview(contentsWrap)
        contentsWrap.addSubview(loginWrap)
        loginWrap.addSubview(loginGL)
        loginWrap.addSubview(loginBtn)
        
    }
    
    func autoLayout() {
        
        /* summary 영역 */
        summaryWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 94)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(height)
        }
        
        defaultProfileImage.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            make.size.equalTo(height)
            make.centerY.equalTo(summaryWrap)
            make.leading.equalTo(22)
        }
        summaryGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 17)
            make.centerY.equalTo(summaryWrap)
            make.leading.equalTo(defaultProfileImage.snp.trailing).offset(10)
            make.trailing.equalTo(-22)
            summaryGL.font = loginGL.font.withSize(fontSize)
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
        
        /* 로그인 버튼 영역 */
        contentsWrap.snp.makeConstraints{ make in
            make.top.equalTo(categoryWrap.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        loginWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 121)
            make.height.equalTo(132)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.top.equalTo(topRatio)
        }

        loginGL.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.height.equalTo(50)
            make.leading.trailing.equalTo(0)
        }

        loginBtn.snp.makeConstraints{ make in
            make.top.equalTo(loginGL.snp.bottom).offset(30)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(54)
        }
        
        /* */
    }
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        sender.showAnimation { [weak self] in
            
        }
    }
}
