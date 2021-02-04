//
//  NoticeVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit

//공지사항
class NoticeVC:BaseViewController {
    
    let noticeView = NoticeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = noticeView
        
        /* UIEvent */
        let isBackEvent = noticeView.backEvent.filter{$0}
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        /* */

    }
}
