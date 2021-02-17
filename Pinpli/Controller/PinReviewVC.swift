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
        
        let isGoLoginEvent = logoutView.goLoginEvent.filter{$0}
        isGoLoginEvent.bind{[weak self] result in
            self?.goLogin()
        }.disposed(by: disposeBag)
    }
    
    //로그인 하러가기 메인으로 이동
    func goLogin(){
        //root초기화
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RootVC") as! RootVC
    
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = vc
    }
}
