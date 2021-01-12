//
//  PinReviewVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit

//Pin한 리뷰
class PinReviewVC:BaseViewController {

    let pinReviewView = PinReviewView()
    let pinReviewIsEmptyView = PinReviewIsEmptyView()
    let logoutView = LogoutView()
    
    lazy var categoryWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = pinReviewView
        
        //로그인이 되어있지 않을경우에만 호출 - 우선 주석 처리
        pinReviewView.logoutViewSetting(logoutView: logoutView)
//        pinReviewView.allBtn.addTarget(self, action: #selector(didTappedFullSizeBtn), for: .touchUpInside)
//        reviewIsEmpty()
    }
//    
//    //리뷰 없음
//    func reviewIsEmpty() {
//        pinReviewView.contentsView.addSubview(pinReviewIsEmptyView.reviewIsEmptyContentsGL)
//        pinReviewView.contentsView.addSubview(pinReviewIsEmptyView.reviewIsEmptyGL01)
//        pinReviewView.contentsView.addSubview(pinReviewIsEmptyView.reviewIsEmptyGL02)
//        
//        pinReviewIsEmptyView.reviewIsEmptyContentsGL.snp.makeConstraints{ make in
//            make.centerX.centerY.equalTo(pinReviewView)
//        }
//        
//        pinReviewIsEmptyView.reviewIsEmptyGL01.snp.makeConstraints{ make in
//            make.centerX.equalTo(pinReviewIsEmptyView.reviewIsEmptyContentsGL)
//            make.bottom.equalTo(pinReviewIsEmptyView.reviewIsEmptyContentsGL.snp.top).offset(-20)
//        }
//        
//        pinReviewIsEmptyView.reviewIsEmptyGL02.snp.makeConstraints{ make in
//            make.top.equalTo(pinReviewIsEmptyView.reviewIsEmptyContentsGL.snp.bottom).offset(20)
//            make.centerX.equalTo(pinReviewIsEmptyView.reviewIsEmptyContentsGL)
//        }
//    }
//    
//    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
//        sender.showAnimation { [weak self] in
//            print("asdkmaslkdklaskdklas")
////            if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
////                self?.present(aroundStoreVC, animated: true, completion: nil)
////            }
//        }
//    }
}
