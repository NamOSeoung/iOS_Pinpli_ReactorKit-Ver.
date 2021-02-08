//
//  UserOutVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/08.
//

import UIKit
import SnapKit

//회원탈퇴 전용 VC
class UserOutVC:BaseViewController {
    
    let userOutView = UserOutView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = userOutView
        
        /* UIEvent */
        let isCloseEvent = userOutView.closeEvent.filter{$0} //화면 닫기 이벤트
        let isUserOutNoEvent = userOutView.userOutNoEvent.filter{$0} //탈퇴 안할래요
        let isUserOutOkEvent = userOutView.userOutOkEvent.filter{$0} //탈퇴 할래요
        
        isUserOutNoEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        isUserOutOkEvent.bind{[weak self] result in
            self?.userOutOkAlert()
        }.disposed(by: disposeBag)
        
        isCloseEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
    
    private func userOutOkAlert() {
        
        
        let alert = UIAlertController(title: "핀플리는 항상 기다리고 있어요 😥", message: "\n탈퇴되었습니다. 이용해주셔서 감사합니다.\n언제든지 회원가입을 할 수 있어요!", preferredStyle: .alert)
        
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
    
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        //
        alert.addAction(UIAlertAction(title: "처음으로", style: .cancel, handler: { (action:UIAlertAction!) in
            
        }))
        subview.backgroundColor = UIColor.white
        present(alert, animated: true)
    }
}
