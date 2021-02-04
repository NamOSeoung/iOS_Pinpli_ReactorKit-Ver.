//
//  TermsVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/04.
//

import UIKit
import SnapKit

//서비스 이용약관, 개인정보 처리방침 전용 VC
class TermsVC:BaseViewController {
    
    let termsView = TermsView()
    var termsGubun:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = termsView
        
        if termsGubun == 0 {
            termsView.headerGL.text = "서비스 이용 약관"
        }else {
            termsView.headerGL.text = "개인정보 처리방침"
        }
        
        /* UIEvent */
        let isCloseEvent = termsView.closeEvent.filter{$0}
        isCloseEvent.bind{[weak self] result in
            self?.dismiss(animated: false, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
}
