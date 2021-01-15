//
//  StoreDetailVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/05.
//

import UIKit
import SnapKit

//가게 상세정보
class StoreDetailVC:BaseViewController {
    
    let storeDetailView = StoreDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = storeDetailView

        /* UIEvent */
        let isBackEvent = storeDetailView.backEvent.filter{$0}
        let isReviewWrite = storeDetailView.reviewWriteEvent.filter{$0}
        
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
        isReviewWrite.bind{[weak self] result in
            let reviewWriteVC = ReviewWriteVC()
            reviewWriteVC.modalPresentationStyle = .fullScreen
            self?.present(reviewWriteVC, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
}
