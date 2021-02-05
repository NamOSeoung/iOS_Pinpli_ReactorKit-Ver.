//
//  QuestionVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/04.
//

import UIKit
import SnapKit

//관리자에게 문의하기 전용 VC
class QuestionWriteVC:BaseViewController {
    
    let questionWriteView = QuestionWriteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = questionWriteView

        /* UIEvent */
        let isCloseEvent = questionWriteView.closeEvent.filter{$0}
        isCloseEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */

    }
}
