//
//  NoticeFAQVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit

//공지사항 FAQ VC
class NoticeFAQVC:BaseViewController {
    
    let noticeFAQView = NoticeFAQView()
    var gubun:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view = noticeFAQView
        
        if gubun {
            noticeFAQView.headerGL.text = "공지사항"
        }else {
            noticeFAQView.headerGL.text = "자주하는 질문"
        }
        /* UIEvent */
        let isBackEvent = noticeFAQView.backEvent.filter{$0}
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        /* */

    }
}
