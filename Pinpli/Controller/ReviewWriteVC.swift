//
//  ReviewWriteVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit

//리뷰 작성
class ReviewWriteVC: BaseViewController {
    let reviewWriteView = ReviewWriteView()
    override func viewDidLoad() {
        view = reviewWriteView
        
        /* UIEvent */
        let backEvent = reviewWriteView.backEvent.filter{$0}
        backEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
}
