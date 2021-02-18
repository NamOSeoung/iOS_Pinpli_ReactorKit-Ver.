//
//  MyInfoVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import SnapKit

//내 정보 전용 VC
class MyInfoVC:BaseViewController {
    
    let myInfoView = MyInfoView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myInfoView
        
        
        /* UIEvent */
        let isBackEvent = myInfoView.backEvent.filter{$0} //화면 뒤로가기 이벤트
        let isLogoutEvent = myInfoView.logoutEvent.filter{$0} //로그아웃 이벤트
        let isUserOutEvent = myInfoView.userOutEvent.filter{$0} //회원탈퇴 이벤트
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        isLogoutEvent.bind{[weak self] result in
            self?.logoutClickEvent()
        }.disposed(by: disposeBag)
        isUserOutEvent.bind{[weak self] result in
            let userOutVC = UserOutVC()
            userOutVC.modalPresentationStyle = .fullScreen
            self?.present(userOutVC, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
        
    }
    
    //로그아웃 처리
    private func logoutClickEvent() {
        //root초기화
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RootVC") as! RootVC
    
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = vc
    }
}
