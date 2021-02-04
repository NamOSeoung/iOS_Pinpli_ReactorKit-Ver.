//
//  FAQVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit

//자주하는 질문
class FAQVC:BaseViewController {
    
    let faqView = FAQView()
//    let myPageLoginView = MyPageLoginView() //로그인 했을 시
//    let myPageLogoutView = MyPageLogoutView() //로그인 안 했을 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = faqView

        /* UIEvent */
        let isBackEvent = faqView.backEvent.filter{$0}
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        /* */

    }
}
